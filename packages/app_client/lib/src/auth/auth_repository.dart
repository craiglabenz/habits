import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
// import 'package:networking/networking.dart';

final _log = Logger('app_client.auth.AuthRepository');

/// Flavor of user login.
enum LoginType {
  /// Logins powered by Google SSO
  google,

  /// Logins powered by Apple SSO
  apple,

  /// Logins powered by old fashioned email and password
  email,

  /// Logins hanging by a thread on an anonymous session
  anonymous
}

/// {@template AuthRepository}
/// Repository which manages user authentication.
/// {@endtemplate}
abstract interface class BaseAuthRepository<T> {
  /// Placeholder for the last [T] emitted from the Firebase auth stream.
  /// A value of `null` indicates that we have not yet completed initial checks
  /// and should probably show the `SplashPage`. Once [initialized] resolves,
  /// this value should never again be `null`. At that time, the most least
  /// information this should contain is `(AuthUser.anonymous, false)`.
  (T, bool)? get lastUser;

  /// Indicates whether initial checks for an existing session have been
  /// completed. While this value is still `false`, no authorization information
  /// on this repository means anything.
  Future<bool> get initialized;

  /// Stream of [T] which will emit the current user when the
  /// authentication state changes.
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
  Future<UserOrError<T>> signInAnonymously(String username);

  /// Signs in with the provided [email] and [password].
  ///
  /// Returns an [AuthenticationError] if an exception occurs.
  Future<UserOrError<T>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs out the current user which will emit `null` from the [user] stream.
  ///
  /// Returns an [AuthenticationError] if an exception occurs.
  Future<Either<AuthenticationError, void>> logOut();

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
    _streamAuthSub = _socialAuthService.users.listen(syncUserToRest);
  }

  StreamSubscription<FirebaseUser?>? _streamAuthSub;

  /// Allows methods like `signIn` and `logInWithGoogle`, etc, to return
  /// [AuthUser] values despite that value popping out of a stream later on,
  /// elsewhere.
  ///
  /// Because we always want to react to auth signals from Firebase, we need to
  /// keep the FirebaseAuth -> RestAuth stream connection alive. However, we
  /// also want our auth methods to return [AuthUser] objects directly (if
  /// asynchronously) instead of exposing all of this stream machinery to all
  /// calling code. Thus, to avoid publishing those user events twice, our
  /// methods know nothing of the streams, and instead await the result of the
  /// [_userCompleter], which they set up before pushing the first auth domino.
  /// This [_userCompleter] is then resolved in the function that glues all of
  /// the streams together - [syncUserToRest].
  Completer<UserOrError<AuthUser>>? _userCompleter;

  /// Helper to be called before attempting any imperative authorization
  /// attempt. This allows [syncUserToRest] to successfully feed the resultant
  /// user back to the `LoginBloc`.
  void _setUpUserCompleter() =>
      _userCompleter = Completer<UserOrError<AuthUser>>();

  /// Helper to be called after attempting any imperative authorization attempt.
  /// This frees up resources after [syncUserToRest] is done with them.
  void _destroyUserCompleter() => _userCompleter = null;

  final BaseSocialAuth _socialAuthService;
  final BaseRestAuth<AuthUser> _restAuthService;
  final StreamController<(AuthUser, bool)> _authUserController;

  @override
  late (AuthUser, bool) lastUser;

  final Completer<bool> _initializedCompleter;

  /// Set during login or account creation and emitted alongside the resulting
  /// user.
  bool? _isNewUserAuthenticating;

  @override
  Future<bool> get initialized => _initializedCompleter.future;

  @override
  Stream<(AuthUser, bool)> get user => _authUserController.stream;

  /// Stores the last login type for [syncUserToRest].
  LoginType? _lastLoginType;

  /// Set during the anonymous user sign in flow. Used to retain the user's
  /// typed username while we wait for Firebase to emit the new anonymous user.
  String? _anonymousUsername;

  /// Sends a new [AuthUser] object through the stream for any listeners.
  ///
  /// This method is registered as a listener to the `FirebaseAuth.user` stream,
  /// which means it is automatically invoked every time the Firebase Auth
  /// system thinks our user's session status has changed.
  Future<void> syncUserToRest(FirebaseUser? firebaseUser) async {
    if (firebaseUser != null) {
      _log.info('Syncing FirebaseUser ${firebaseUser.uid} to Rest API');
      final maybeUser = await _restLoginOrRegister(firebaseUser);
      _lastLoginType = null;
      _userCompleter?.complete(maybeUser);

      // Lastly, send all of this information to the rest of the app.
      if (maybeUser.isLeft()) {
        _log.warning('RestAuth returned error: ${maybeUser.leftOrRaise()}');
        _publishNewUser(AuthUser.anonymous, false);
      } else {
        _log.finer('RestAuth returned user');
        _publishNewUser(maybeUser.getOrRaise(), _isNewUserAuthenticating!);
        _isNewUserAuthenticating = null;
      }
    } else {
      _log.info('NULL user from Firebase');
      _publishNewUser(AuthUser.anonymous, false);
    }
    if (!_initializedCompleter.isCompleted) {
      _initializedCompleter.complete(true);
    }
  }

  void _publishNewUser(AuthUser user, bool isNewUser) {
    assert(
      !(user == AuthUser.anonymous && isNewUser),
      'Must not set value of `isNewUser=true` when session is anonymous',
    );
    if (_initializedCompleter.isCompleted &&
        user == lastUser.$1 &&
        isNewUser == lastUser.$2) {
      _log.finer('Skipping publish of same old user');
      return;
    }
    _log.info('Publishing $user to app');
    lastUser = (user, isNewUser);
    _authUserController.sink.add((user, isNewUser));
  }

  /// Attempts to copy a Firebase Auth session to the REST backend.
  Future<UserOrError<AuthUser>> _restLoginOrRegister(
    FirebaseUser firebaseUser,
  ) async {
    _log.info(
      'Syncing ${firebaseUser.uid} to Rest after login type $_lastLoginType',
    );
    // If the user flow is an anonymous session creation, finish the job by
    // syncing that to the REST server.
    if (_lastLoginType == LoginType.anonymous) {
      _isNewUserAuthenticating = true;
      return _restAnonymous(firebaseUser);
    }

    // New users (aka, `firebaseUser.isNew == true`) at this point are
    // (potentially?) an error, but if login fails then the user records should
    // be completely destroyed.
    _isNewUserAuthenticating = false;
    return _restLogin(firebaseUser);

    // See if this already exists in the application server database.
    // _isNewUserAuthenticating = firebaseUser.isNew;
    // return firebaseUser.isNew
    //     ? _restRegister(firebaseUser)
    //     : _restLogin(firebaseUser);
  }

  /// Helper to complete anonymous session creation which started with Firebase.
  Future<UserOrError<AuthUser>> _restAnonymous(FirebaseUser user) async {
    assert(
      _anonymousUsername != null,
      'Should not have reached `_restAnonymous` without a store username value',
    );
    final userOrError = await _restAuthService.createAnonymous(
      firebaseUid: user.uid,
      username: _anonymousUsername!,
    );
    if (userOrError.isLeft()) {
      _log.warning('RestAuth anonymous FAILURE: ${userOrError.leftOrRaise()}');
      // If we could not login this user with the REST backend, then we should
      // logout from Firebase to not have a half-logged-in state.
      await _socialAuthService.deleteUser(user);
      await _socialAuthService.logOut();
    }
    return userOrError;
  }

  /// Helper method to complete other login methods that start with Firebase.
  Future<UserOrError<AuthUser>> _restLogin(FirebaseUser user) async {
    _log.finer('RestAuth login for ${user.uid}');
    final userOrError = await _restAuthService.login(
      email: _lastLoginType == LoginType.anonymous
          ? '${user.uid}@habits.xyz'
          : user.email ?? '',
      password: user.uid,
    );
    if (userOrError.isLeft()) {
      _log.warning('RestAuth login FAILURE: ${userOrError.leftOrRaise()}');
      // If we could not login this user with the REST backend, then we should
      // logout from Firebase to not have a half-logged-in state.
      // await _socialAuthService.deleteUser(user);
      // await _socialAuthService.logOut();
    }
    return userOrError;
  }

  /// Helper method to complete other login methods that start with Firebase.
  // ignore: unused_element
  Future<UserOrError<AuthUser>> _restRegister(FirebaseUser user) async {
    _log.finer('RestAuth register for ${user.uid}');
    final userOrError = await _restAuthService.register(
      email: _lastLoginType == LoginType.anonymous
          ? '${user.uid}@habits.xyz'
          : user.email ?? '',
      password: user.uid,
    );
    if (userOrError.isLeft()) {
      _log.warning('RestAuth register FAILURE: ${userOrError.leftOrRaise()}');
      // If we failed to create this user in the REST backend, then the
      // [FirebaseUser] will be orphaned, and we should delete
      await _socialAuthService.deleteUser(user);
      await _socialAuthService.logOut();
    }
    return userOrError;
  }

  @override
  Future<UserOrError<AuthUser>> signUp({
    required String email,
    required String password,
  }) async {
    _lastLoginType = LoginType.email;
    return _curriedLoginOrRegister(
      () => _socialAuthService.signUp(
        email: email,
        password: password,
      ),
      onError: (AuthenticationError error) async {
        final methods = await _socialAuthService.getAvailableMethods(email);
        if (methods.isNotEmpty) {
          return AuthenticationError.wrongMethod(methods);
        }
        return error;
      },
    );
  }

  @override
  Future<UserOrError<AuthUser>> signInAnonymously(String username) {
    _log.finer('Signing in anonymously');
    _lastLoginType = LoginType.anonymous;
    _anonymousUsername = username;
    return _curriedLoginOrRegister(_socialAuthService.signInAnonymously);
  }

  @override
  Future<UserOrError<AuthUser>> logInWithApple() async {
    _log.finer('Signing in via Apple');
    _lastLoginType = LoginType.apple;
    return _curriedLoginOrRegister(_socialAuthService.logInWithApple);
  }

  @override
  Future<UserOrError<AuthUser>> logInWithGoogle() async {
    _log.finer('Signing in via Google');
    _lastLoginType = LoginType.google;
    return _curriedLoginOrRegister(_socialAuthService.logInWithGoogle);
  }

  @override
  Future<UserOrError<AuthUser>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _log.finer('Signing in via Email::Password');
    _lastLoginType = LoginType.email;
    return _curriedLoginOrRegister(
      () => _socialAuthService.logInWithEmailAndPassword(
        email: email,
        password: password,
      ),
      onError: (AuthenticationError error) async {
        final methods = await _socialAuthService.getAvailableMethods(email);
        if (methods.isNotEmpty) {
          return AuthenticationError.wrongMethod(methods);
        }
        return error;
      },
    );
  }

  Future<UserOrError<AuthUser>> _curriedLoginOrRegister(
    Future<FirebaseUserOrError> Function() sessionCreator, {
    Future<AuthenticationError> Function(AuthenticationError)? onError,
  }) async {
    _setUpUserCompleter();
    final firebaseUserOrError = await sessionCreator();
    if (firebaseUserOrError.isLeft()) {
      final firebaseError = firebaseUserOrError.leftOrRaise();
      final handledError =
          onError != null ? await onError(firebaseError) : firebaseError;
      return Left(handledError);
    }
    final userOrError = await _userCompleter!.future;
    _destroyUserCompleter();
    return userOrError;
  }

  @override
  Future<Either<AuthenticationError, void>> logOut() async =>
      _socialAuthService.logOut();

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
}

/// {@template FakeAuthRepository}
/// Faked implementation of [BaseAuthRepository] that is helpful when testing
/// objects which depend on an auth repository but do not want to bother with
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
  @override
  (AuthUser, bool)? lastUser;

  late final StreamController<(AuthUser, bool)> _authUserController;

  @override
  Stream<(AuthUser, bool)> get user => _authUserController.stream;

  /// Adds the new [AuthUser] to the stream for any listeners to react.
  @visibleForTesting
  // ignore: avoid_positional_boolean_parameters
  void publishNewUser(AuthUser user, bool isNewUser) {
    lastUser = (user, isNewUser);
    _authUserController.sink.add((user, isNewUser));
  }

  @override
  Future<void> dispose() async {
    await _authUserController.close();
  }

  @override
  Future<UserOrError<AuthUser>> signInAnonymously(String username) =>
      throw Exception(
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
  Future<Either<AuthenticationError, void>> logOut() => throw Exception(
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
  Future<bool> get initialized => _initializedCompleter.future;

  /// Test-only function to move this fake AuthRepository into active mode.
  /// Without calling this function, [initialized] will never complete, which
  /// may be what you want depending on the test.
  void setAsInitialized([(AuthUser, bool)? newLastUser]) {
    lastUser ??= newLastUser ?? (AuthUser.anonymous, false);
    _initializedCompleter.complete(true);
  }
}

/// Adds a convenient getter to [FirebaseUser] which identifies new users.
extension NewAwareFirebaseUser on FirebaseUser {
  /// Returns true if this is the given account's first session.
  bool get isNew => metadata.creationTime == metadata.lastSignInTime;
}
