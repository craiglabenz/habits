import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
// import 'package:networking/networking.dart';

final _log = Logger('auth.AuthRepository');

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
  /// and should probably show the `SplashPage`. A value of `null` when
  /// [initialized] equals true indicates that we have completed the initial
  /// checks and no user is logged in, so we should probably show the
  /// `LoginPage`.
  T? get lastUser;

  /// Indicates whether initial checks for an existing session have been
  /// completed. While this value is still `false`, no authorization information
  /// on this repository means anything.
  bool get initialized;

  /// Stream of [T] which will emit the current user when the
  /// authentication state changes.
  ///
  /// Emits `null` if the user is not authenticated.
  Stream<T?> get user;

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
  ///
  /// Returns an [AuthenticationError] if an exception occurs.
  Future<Either<AuthenticationError, void>> logOut();

  /// Cleans up all resources.
  Future<void> dispose();
}

/// {@macro AuthRepository}
class AuthRepository<T> implements BaseAuthRepository<T> {
  /// {@macro AuthRepository}
  AuthRepository({
    required BaseSocialAuth streamAuthService,
    required BaseRestAuth<T> restAuthService,
  })  : _socialAuthService = streamAuthService,
        _restAuthService = restAuthService,
        _authUserController = StreamController<T?>.broadcast() {
    _streamAuthSub = _socialAuthService.users.listen(syncUserToRest);
  }

  StreamSubscription<FirebaseUser?>? _streamAuthSub;

  /// Allows methods like `signIn` and `logInWithGoogle`, etc, to return
  /// [T] values despite that value popping out of a stream later on,
  /// elsewhere.
  ///
  /// Because we always want to react to auth signals from Firebase, we need to
  /// keep the FirebaseAuth -> RestAuth stream connection alive. However, we
  /// also want our auth methods to return [T] objects directly (if
  /// asynchronously) instead of exposing all of this stream machinery to all
  /// calling code. Thus, to avoid publishing those user events twice, our
  /// methods know nothing of the streams, and instead await the result of the
  /// [_userCompleter], which they set up before pushing the first auth domino.
  /// This [_userCompleter] is then resolved in the function that glues all of
  /// the streams together - [syncUserToRest].
  Completer<UserOrError<T>>? _userCompleter;

  /// Helper to be called before attempting any imperative authorization
  /// attempt. This allows [syncUserToRest] to successfully feed the resultant
  /// user back to the `LoginBloc`.
  void _setUpUserCompleter() => _userCompleter = Completer<UserOrError<T>>();

  /// Helper to be called after attempting any imperative authorization attempt.
  /// This frees up resources after [syncUserToRest] is done with them.
  void _destroyUserCompleter() => _userCompleter = null;

  final BaseSocialAuth _socialAuthService;
  final BaseRestAuth<T> _restAuthService;
  final StreamController<T?> _authUserController;

  @override
  T? lastUser;

  @override
  bool initialized = false;

  @override
  Stream<T?> get user => _authUserController.stream;

  /// Stores the last login type for [syncUserToRest].
  LoginType? _lastLoginType;

  /// Sends a new [T] object through the stream for any listeners.
  ///
  /// This method is registered as a listener to the `FirebaseAuth.user` stream,
  /// which means it is automatically invoked every time the Firebase Auth
  /// system thinks our user's session status has changed.
  Future<void> syncUserToRest(FirebaseUser? firebaseUser) async {
    if (firebaseUser != null) {
      _log.info('Syncing FirebaseUser $firebaseUser to Rest API');
      final maybeUser = await _restLoginOrRegister(firebaseUser);
      _lastLoginType = null;
      _userCompleter?.complete(maybeUser);

      // Lastly, send all of this information to the rest of the app.
      if (maybeUser.isLeft()) {
        _publishNewUser(null);
      } else {
        _publishNewUser(maybeUser.getOrRaise());
      }
    } else {
      _log.info(
        'NULL user from Firebase. Publishing [AuthUser.anonymous] to app',
      );
      _publishNewUser(null);
    }
  }

  void _publishNewUser(T? user) {
    lastUser = user;
    _authUserController.sink.add(user);
  }

  /// Attempts to copy a Firebase Auth session to the REST backend.
  Future<UserOrError<T>> _restLoginOrRegister(
    FirebaseUser firebaseUser,
  ) async {
    // See if this already exists in the application server database.
    return firebaseUser.isNew
        ? _restRegister(firebaseUser)
        : _restLogin(firebaseUser);

    // Alternate implementation below. Above could be better as it does not
    // threaten to silently fragment accounts downstream of a Firebase auth bug.
    // However, this also throws false-positive errors for existing users which
    // is a pain, so we'd have to figure that out.
    // final loginUserOrError = await _restLogin(firebaseUser);
    // if (loginUserOrError.isRight()) {
    //   return loginUserOrError;
    // }

    // If the application server also has no idea, then just create them.
    // return _restRegister(firebaseUser);
  }

  /// Helper method to complete other login methods that start with Firebase.
  Future<UserOrError<T>> _restLogin(FirebaseUser user) async {
    final userOrError = await _restAuthService.login(
      email: _lastLoginType == LoginType.anonymous
          ? '${user.uid}@habits.xyz'
          : user.email ?? '',
      password: user.uid,
    );
    if (userOrError.isLeft()) {
      // If we could not login this user with the REST backend, then we should
      // logout from Firebase to not have a half-logged-in state.
      await _socialAuthService.logOut();
    }
    return userOrError;
  }

  /// Helper method to complete other login methods that start with Firebase.
  Future<UserOrError<T>> _restRegister(FirebaseUser user) async {
    final userOrError = await _restAuthService.register(
      email: _lastLoginType == LoginType.anonymous
          ? '${user.uid}@habits.xyz'
          : user.email ?? '',
      password: user.uid,
    );
    if (userOrError.isLeft()) {
      // If we failed to create this user in the REST backend, then the
      // [FirebaseUser] will be orphaned, and we should delete
      await _socialAuthService.deleteUser(user);
    }
    return userOrError;
  }

  @override
  Future<UserOrError<T>> signUp({
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
  Future<UserOrError<T>> signInAnonymously() {
    _lastLoginType = LoginType.anonymous;
    return _curriedLoginOrRegister(_socialAuthService.signInAnonymously);
  }

  @override
  Future<UserOrError<T>> logInWithApple() async {
    _lastLoginType = LoginType.apple;
    return _curriedLoginOrRegister(_socialAuthService.logInWithApple);
  }

  @override
  Future<UserOrError<T>> logInWithGoogle() async {
    _lastLoginType = LoginType.google;
    return _curriedLoginOrRegister(_socialAuthService.logInWithGoogle);
  }

  @override
  Future<UserOrError<T>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
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

  Future<UserOrError<T>> _curriedLoginOrRegister(
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

  // @override
  // Future<Either<DisplayableError, Profile>> updateUserProfile(
  //   Profile profile,
  // ) async {
  //   assert(
  //     lastUser != null,
  //     "Cannot update a user's profile while unauthenticated",
  //   );
  //   final profileOrError = await _restAuthService.updateUserProfile(
  //     lastUser,
  //     profile,
  //   );
  //   if (profileOrError.isRight()) {
  //     final updateProfile = profileOrError.getOrRaise();
  //     await GetIt.I<Repository<Profile, String>>().setItem(
  //       updateProfile,
  //       RequestDetails<Profile>(requestType: RequestType.local),
  //     );
  //     return Right(updateProfile);
  //   } else {
  //     return const Left(
  //      DisplayableError('Unable to update profile. Please try again later.'),
  //     );
  //   }
  // }

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
class FakeAuthRepository<T> implements BaseAuthRepository<T> {
  /// {@macro FakeAuthRepository}
  FakeAuthRepository() {
    _authUserController = StreamController<T?>.broadcast();
  }
  @override
  T? lastUser;

  late final StreamController<T?> _authUserController;

  @override
  Stream<T?> get user => _authUserController.stream;

  /// Adds the new [T] to the stream for any listeners to react.
  @visibleForTesting
  void publishNewUser(T user) {
    lastUser = user;
    _authUserController.sink.add(user);
  }

  @override
  Future<void> dispose() async {
    await _authUserController.close();
  }

  @override
  Future<UserOrError<T>> signInAnonymously() => throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishUser`.',
      );

  @override
  Future<UserOrError<T>> logInWithApple() => throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishUser`.',
      );

  @override
  Future<UserOrError<T>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishUser`.',
      );

  @override
  Future<UserOrError<T>> logInWithGoogle() => throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishUser`.',
      );

  @override
  Future<Either<AuthenticationError, void>> logOut() => throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishUser`.',
      );

  @override
  Future<UserOrError<T>> signUp({
    required String email,
    required String password,
  }) =>
      throw Exception(
        'Do not call real methods on FakeAuthRepository. '
        'Only call `publishUser`.',
      );

  // @override
  // Future<Either<DisplayableError, Profile>> updateUserProfile(
  //   Profile profile,
  // ) =>
  //     throw Exception(
  //       'Do not call real methods on FakeAuthRepository. '
  //       'Only call `publishUser`.',
  //     );

  @override
  bool initialized = true;
}

/// Adds a convenient getter to [FirebaseUser] which identifies new users.
extension NewAwareFirebaseUser on FirebaseUser {
  /// Returns true if this is the given account's first session.
  bool get isNew => metadata.creationTime == metadata.lastSignInTime;
}
