import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
// import 'package:networking/networking.dart';

final _log = AppLogger('app_client.auth.AuthRepository', Level.WARNING);

/// {@template AuthRepository}
/// Repository which manages user authentication.
/// {@endtemplate}
abstract interface class BaseAuthRepository<T> {
  /// Placeholder for the last [T] emitted from the Firebase auth stream.
  /// A value of `null` indicates that we have not yet completed initial checks
  /// and should probably show the `SplashPage`. Once [ready] resolves,
  /// this value should never again be `null`. At that time, the most least
  /// information this should contain is `(AuthUser.unknown, false)`.
  (T, bool) get lastUser;

  /// Indicates whether initial checks for an existing session have been
  /// completed. While this value is still `false`, no authorization information
  /// on this repository means anything.
  Future<bool> get ready;

  /// Stream of ([T], `bool`) which will emit the current user when the
  /// authentication state changes and a boolean for whether that user's account
  /// was just created.
  ///
  /// Emits `null` before the initial check has been completed, then either a
  /// valid user or an "anonymous" sentinel/singleton afterward.
  Stream<(T, bool)> get user;

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws an [AuthenticationError] if an exception occurs.
  Future<UserOrError<T>> signUp({
    required String email,
    required String password,
  });

  /// Starts the Sign In with Apple Flow.
  ///
  /// Returns an [AuthenticationError] if an exception occurs.
  Future<UserOrError<T>> logInWithApple();

  /// Starts the Sign In with Google Flow.
  ///
  /// Returns an [AuthenticationError] if an exception occurs.
  Future<UserOrError<T>> logInWithGoogle();

  /// Creates a fresh anonymous session for a new user.
  ///
  /// Returns an [AuthenticationError] if an exception occurs.
  Future<UserOrError<T>> signInAnonymously();

  /// Signs in with the provided [email] and [password].
  ///
  /// Returns an [AuthenticationError] if an exception occurs.
  Future<UserOrError<T>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs out the current user which will emit `null` from the [user] stream.
  Future<AuthenticationError?> logOut();

  /// Cleans up all resources.
  Future<void> dispose();
}

/// {@macro AuthRepository}
class AuthRepository implements BaseAuthRepository<AuthUser> {
  /// {@macro AuthRepository}
  AuthRepository({
    BaseSocialAuth? socialAuthService,
    BaseRestAuth<AuthUser>? restAuthService,
  })  : _socialAuthService = socialAuthService ?? GetIt.I<BaseSocialAuth>(),
        _restAuthService = restAuthService ?? GetIt.I<BaseRestAuth<AuthUser>>(),
        _authUserController = StreamController<(AuthUser, bool)>.broadcast(),
        _initializedCompleter = Completer<bool>() {
    _streamAuthSub = _socialAuthService.users.listen(onNewFirebaseUser);
    _initializedCompleter.future.then((val) => _isReady = val);
  }

  StreamSubscription<FirebaseUser?>? _streamAuthSub;

  final BaseSocialAuth _socialAuthService;
  final BaseRestAuth<AuthUser> _restAuthService;
  final StreamController<(AuthUser, bool)> _authUserController;

  // Internal holder for _lastUser which the AuthRepository can access during
  // initialization.
  // ignore: use_late_for_private_fields_and_variables
  (AuthUser, bool)? _lastUser;

  @override
  (AuthUser, bool) get lastUser {
    assert(
      _initializedCompleter.isCompleted,
      'Must not access AuthRepository.lastUser until the '
      'AuthRepository.initialized future resolves',
    );
    return _lastUser!;
  }

  /// Completes with `true` when the first user is resolved, or `false` if there
  /// are any errors. Note that [AuthUser.unknown] sessions will still yield
  /// a value of `true` here.
  final Completer<bool> _initializedCompleter;

  @override
  Future<bool> get ready => _initializedCompleter.future;

  bool _isReady = false;

  /// Synchronous checker for whether or not [ready] has already resolved with
  /// a value of true.
  bool get isReady => _isReady;

  /// Synchronous checker for whether or not [ready] is either still pending or
  /// has resolved with a value of false.
  bool get isNotReady => !_isReady;

  @override
  Stream<(AuthUser, bool)> get user => _authUserController.stream;

  /// Sends a new [AuthUser] object through the stream for any listeners.
  ///
  /// This method is registered as a listener to the `FirebaseAuth.user` stream,
  /// which means it is automatically invoked every time the Firebase Auth
  /// system thinks our user's session status has changed.
  Future<void> onNewFirebaseUser(FirebaseUser? firebaseUser) async {
    log('New FirebaseUser: $firebaseUser');
    if (!_initializedCompleter.isCompleted) {
      // This is SocialAuth's first emitted user
      if (firebaseUser == null) {
        _publishNewUser(AuthUser.unknown, false);
      } else {
        _publishNewUser(await _restCheckSession(firebaseUser), false);
      }
    }
    if (firebaseUser == null) {
      _publishNewUser(AuthUser.unknown, false);
    }
    // Ignore reports of actual users, as these should have originated from
    // specific methods which are handling these sessions.
  }

  void _publishNewUser(AuthUser user, bool isNewUser) {
    assert(
      !(user == AuthUser.unknown && isNewUser),
      'Must not set value of `isNewUser=true` when session is unknown',
    );
    if (_initializedCompleter.isCompleted &&
        user == lastUser.$1 &&
        isNewUser == lastUser.$2) {
      log('Skipping redundant publish of $user', Level.FINEST);
      return;
    }
    log('Publishing $user to app');
    if (!_initializedCompleter.isCompleted) {
      _initializedCompleter.complete(true);
    }
    _lastUser = (user, isNewUser);
    _authUserController.sink.add((user, isNewUser));
  }

  /// Called for the very first user emitted by Firebase, which, if non-null,
  /// would mean Firebase successfully restored a previous session. This would
  /// make it [_restAuthService]'s job to hold serve and verify the same
  /// session.
  Future<AuthUser> _restCheckSession(FirebaseUser user) async {
    log(
      'Confirming RestAuth session for Social User :: ${user.uid}',
      Level.FINE,
    );
    final userOrError = await _restAuthService.checkSession();
    if (userOrError.isLeft()) {
      log(
        'RestAuth.checkSession error: ${userOrError.leftOrRaise()}',
        Level.SEVERE,
      );
      await logOut();
      return AuthUser.unknown;
    }
    final restUser = userOrError.getOrRaise();
    if (restUser.id != user.uid) {
      // FirebaseUser.uid is wired through to AuthUser.id on the server, and if
      // these two values do not match then SocialAuth and RestAuth were not
      // in agreement.
      log(
        'SocialAuth and RestAuth out of sync. Rest Id: ${restUser.id} vs '
        'Social Uid: ${user.uid}',
        Level.SEVERE,
      );
      await logOut();
      return AuthUser.unknown;
    }
    return restUser;
  }

  @override
  Future<UserOrError<AuthUser>> signUp({
    required String email,
    required String password,
  }) async {
    log('Registering new user', Level.FINER);
    return _completeAuthorization(
      isUserNew: true,
      socialSessionCreator: () => _socialAuthService.signUp(
        email: email,
        password: password,
      ),
      syncToRest: (FirebaseUser user) {
        return _restAuthService.register(email: email, password: password);
      },
      socialErrorInterceptor: (AuthenticationError error) async {
        final methods = await _socialAuthService.getAvailableMethods(email);
        if (methods.isNotEmpty) {
          return AuthenticationError.wrongMethod(methods);
        }
        return error;
      },
    );
  }

  /// Creates a brand new anonymous session for this user, which is then synced
  /// to [_restAuthService] using the [BaseRestAuth.createAnonymous] method.
  /// On subsequent launches of the app (until the user upgrades their
  /// account), [_restCheckSession] will discover their [_restAuthService] API
  /// credentials in local storage and restore the account directly.
  @override
  Future<UserOrError<AuthUser>> signInAnonymously() {
    log('Signing in anonymously', Level.FINER);
    return _completeAuthorization(
      isUserNew: true,
      socialSessionCreator: _socialAuthService.signInAnonymously,
      syncToRest: (FirebaseUser user) {
        return _restAuthService.createAnonymous(
          firebaseUid: user.uid,
        );
      },
    );
  }

  @override
  Future<UserOrError<AuthUser>> logInWithApple() async {
    log('Signing in via Apple', Level.FINER);
    return _completeAuthorization(
      isUserNew: null, // Deduce this answer from `firebaseUser.isNew`
      socialSessionCreator: _socialAuthService.logInWithApple,
      syncToRest: (FirebaseUser user) {
        throw UnimplementedError();
      },
    );
  }

  @override
  Future<UserOrError<AuthUser>> logInWithGoogle() async {
    log('Signing in via Google', Level.FINER);
    return _completeAuthorization(
      isUserNew: null, // Deduce this answer from `firebaseUser.isNew`
      socialSessionCreator: _socialAuthService.logInWithGoogle,
      syncToRest: (FirebaseUser user) {
        throw UnimplementedError();
      },
    );
  }

  @override
  Future<UserOrError<AuthUser>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    log('Signing in via Email::Password', Level.FINER);
    return _completeAuthorization(
      isUserNew: false,
      socialSessionCreator: () => _socialAuthService.logInWithEmailAndPassword(
        email: email,
        password: password,
      ),
      syncToRest: (FirebaseUser user) {
        return _restAuthService.login(email: email, password: password);
      },
      socialErrorInterceptor: (AuthenticationError error) async {
        final methods = await _socialAuthService.getAvailableMethods(email);
        if (methods.isNotEmpty) {
          return AuthenticationError.wrongMethod(methods);
        }
        return error;
      },
    );
  }

  Future<UserOrError<AuthUser>> _completeAuthorization({
    required Future<FirebaseUserOrError> Function() socialSessionCreator,
    required Future<UserOrError<AuthUser>> Function(FirebaseUser) syncToRest,
    required bool? isUserNew,
    Future<AuthenticationError> Function(AuthenticationError)?
        socialErrorInterceptor,
    Future<AuthenticationError> Function(AuthenticationError)?
        restErrorInterceptor,
  }) async {
    final firebaseUserOrError = await socialSessionCreator();
    if (firebaseUserOrError.isLeft()) {
      final firebaseError = firebaseUserOrError.leftOrRaise();
      final handledError = socialErrorInterceptor != null //
          ? await socialErrorInterceptor(firebaseError)
          : firebaseError;
      return Left(handledError);
    }
    final firebaseUser = firebaseUserOrError.getOrRaise();

    final restUserOrError = await syncToRest(firebaseUser);
    if (restUserOrError.isLeft()) {
      final restError = restUserOrError.leftOrRaise();
      final handledError = restErrorInterceptor != null //
          ? await restErrorInterceptor(restError)
          : restError;
      return Left(handledError);
    }
    final restUser = restUserOrError.getOrRaise();

    if (restUser.id != firebaseUser.uid) {
      log(
        'RestUser.id ${restUser.id} != FirebaseUser.uid ${firebaseUser.uid}',
        Level.SEVERE,
      );
      final logoutError = await logOut();
      if (logoutError != null) {
        return Left(logoutError);
      }
      return const Right(AuthUser.unknown);
    }

    // This is the final, correct user.
    _publishNewUser(restUser, isUserNew ?? firebaseUser.isNew);
    return Right(restUser);
  }

  @override
  Future<AuthenticationError?> logOut() async {
    try {
      await Future.wait<dynamic>([
        _socialAuthService.logOut(),
        _restAuthService.logOut(),
      ]);
    } on Exception catch (e, st) {
      log('Error logging out: $e', Level.SHOUT);
      log(st.toString(), Level.SHOUT);
      return const AuthenticationError.unknownError();
    }
    return null;
  }

  @override
  Future<void> dispose() async {
    if (_streamAuthSub != null) {
      await Future.wait([
        _streamAuthSub!.cancel(),
        _authUserController.close(),
      ]);
      _streamAuthSub = null;
    }
  }

  /// Logging wrapper to easily turn on logging during tests.
  void log(String message, [Level level = Level.INFO]) {
    // ignore: avoid_print
    // print('[${_log.name}][${level.name}] $message');
    _log.log(message, level);
  }
}

/// {@template FakeAuthRepository}
/// Faked implementation of [BaseAuthRepository] that is helpful when testing
/// objects which depend on an [AuthRepository] but do not want to bother with
/// complicated login mechanics.
///
/// Usage:
/// ```dart
/// final authRepo = FakeAuthRepo();
/// // mimics a successful login flow for `myUser`
/// authRepo.publishNewUser(myUser);
/// ```
/// {@endtemplate}
class FakeAuthRepository implements BaseAuthRepository<AuthUser> {
  /// {@macro FakeAuthRepository}
  FakeAuthRepository() {
    _authUserController = StreamController<(AuthUser, bool)>.broadcast();
  }

  (AuthUser, bool)? _lastUser;

  @override
  (AuthUser, bool) get lastUser {
    assert(
      _initializedCompleter.isCompleted,
      'Must not access AuthRepository.lastUser until the '
      'AuthRepository.initialized future resolves',
    );
    return _lastUser!;
  }

  late final StreamController<(AuthUser, bool)> _authUserController;

  @override
  Stream<(AuthUser, bool)> get user => _authUserController.stream;

  /// Adds the new [AuthUser] to the stream for any listeners to react.
  @visibleForTesting
  // ignore: avoid_positional_boolean_parameters
  void publishNewUser(AuthUser user, bool isNewUser) {
    _lastUser = (user, isNewUser);
    _authUserController.sink.add((user, isNewUser));
  }

  @override
  Future<void> dispose() async {
    await _authUserController.close();
  }

  @override
  Future<UserOrError<AuthUser>> signInAnonymously() => throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishNewUser`.',
      );

  @override
  Future<UserOrError<AuthUser>> logInWithApple() => throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishNewUser`.',
      );

  @override
  Future<UserOrError<AuthUser>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishNewUser`.',
      );

  @override
  Future<UserOrError<AuthUser>> logInWithGoogle() => throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishNewUser`.',
      );

  @override
  Future<AuthenticationError?> logOut() => throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishNewUser`.',
      );

  @override
  Future<UserOrError<AuthUser>> signUp({
    required String email,
    required String password,
  }) =>
      throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishNewUser`.',
      );

  final _initializedCompleter = Completer<bool>();

  @override
  Future<bool> get ready => _initializedCompleter.future;

  /// Test-only function to move this fake AuthRepository into active mode.
  /// Without calling this function, [ready] will never complete, which
  /// may or may not be what you want depending on the test.
  @visibleForTesting
  void setAsInitialized([(AuthUser, bool)? newLastUser]) {
    _lastUser ??= newLastUser ?? (AuthUser.unknown, false);
    _initializedCompleter.complete(true);
  }
}

/// Adds a convenient getter to [FirebaseUser] which identifies new users.
extension NewAwareFirebaseUser on FirebaseUser {
  /// Returns true if this is the given account's first session.
  bool get isNew => metadata.creationTime == metadata.lastSignInTime;
}
