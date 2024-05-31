import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logging/logging.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final _log = Logger('auth.StreamAuth');

/// Shorthand for a user from Firebase.
typedef FirebaseUser = firebase_auth.User;

/// Either a successful [FirebaseUser] or an [AuthenticationError].
typedef FirebaseUserOrError = Either<AuthenticationError, FirebaseUser>;

/// Signature for [SignInWithApple.getAppleIDCredential].
typedef GetAppleCredentials = Future<AuthorizationCredentialAppleID> Function({
  required List<AppleIDAuthorizationScopes> scopes,
  WebAuthenticationOptions webAuthenticationOptions,
  String nonce,
  String state,
});

/// {@template LogoutSentinel}
/// Indicator of a successful logout.
/// {@endtemplate}
class LogoutSentinel {
  /// {@macro LogoutSentinel}
  const LogoutSentinel();
}

/// Defines the contract for authorizing users through 3P IAPs, like Google or
/// Apple.
abstract class BaseSocialAuth {
  /// Stream of user updates from the Firebase servers.
  Stream<FirebaseUser?> get users;

  /// Creates a new user with the provided email and password.
  Future<FirebaseUserOrError> signUp({
    required String email,
    required String password,
  });

  /// Initiates the Apple Id login flow.
  Future<FirebaseUserOrError> logInWithApple();

  /// Initiates the Google login flow.
  Future<FirebaseUserOrError> logInWithGoogle();

  /// Logs in an existing user via their email and password.
  Future<FirebaseUserOrError> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Logs in an existing user by creating an anonymous session.
  Future<FirebaseUserOrError> signInAnonymously();

  /// Deletes the given user's account.
  Future<void> deleteUser(FirebaseUser user);

  /// Terminates any open user session with Firebase.
  Future<Either<AuthenticationError, LogoutSentinel>> logOut();

  /// Returns the set of Firebase login methods a user may to resume their
  /// session.
  Future<Set<AuthType>> getAvailableMethods(String email);
}

/// Executes real session actions with Firebase.
class FirebaseAuthService extends BaseSocialAuth {
  /// Default constructor for [FirebaseAuthService].
  FirebaseAuthService({
    GetAppleCredentials? getAppleCredentials,
    GoogleSignIn? googleSignIn,
    firebase_auth.FirebaseAuth? firebaseAuth,
  })  : _getAppleCredentials =
            getAppleCredentials ?? SignInWithApple.getAppleIDCredential,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final GetAppleCredentials _getAppleCredentials;

  @override
  Future<Set<AuthType>> getAvailableMethods(String email) async =>
      loginTypesFromStrings(
        // ignore: deprecated_member_use
        await _firebaseAuth.fetchSignInMethodsForEmail(email),
      );

  /// Starts the Sign In with Apple Flow.
  ///
  /// Throws an [AuthenticationError] if an exception occurs.
  @override
  Future<FirebaseUserOrError> logInWithApple() async {
    try {
      final appleIdCredential = await _getAppleCredentials(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oAuthProvider = firebase_auth.OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: appleIdCredential.identityToken,
        accessToken: appleIdCredential.authorizationCode,
      );
      final userCred = await _firebaseAuth.signInWithCredential(credential);
      if (userCred.user != null) {
        return Right(userCred.user!);
      }
      _log.severe('loginWithApple failed without throwing exception');
      return const Left(AuthenticationError.unknownError());
    } on firebase_auth.FirebaseAuthException catch (e) {
      _log.severe('Firebase exception during logInWithApple: $e');
      return Left(AuthenticationErrorFromFirebase.fromFirebaseException(e));
    } on Exception catch (e) {
      _log.severe('Unexpected logInWithApple Exception: $e');
      return const Left(AuthenticationError.unknownError());
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws an [AuthenticationError] if an exception occurs.
  @override
  Future<FirebaseUserOrError> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCred = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.toLowerCase().trim(),
        password: password,
      );
      if (userCred.user != null) {
        return Right(userCred.user!);
      }
      _log.severe(
        'logInWithEmailAndPassword failed without throwing exception',
      );
      return const Left(AuthenticationError.unknownError());
    } on firebase_auth.FirebaseAuthException catch (e) {
      _log.severe('Firebase exception during logInWithEmailAndPassword: $e');
      return Left(AuthenticationErrorFromFirebase.fromFirebaseException(e));
    } on Exception catch (e) {
      _log.warning('Unexpected logInWithEmailAndPassword Exception: $e');
      return const Left(AuthenticationError.unknownError());
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws an [AuthenticationError] if an exception occurs.
  @override
  Future<FirebaseUserOrError> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCred = await _firebaseAuth.signInWithCredential(credential);
      if (userCred.user != null) {
        return Right(userCred.user!);
      }
      _log.severe('logInWithGoogle failed without throwing exception');
      return const Left(AuthenticationError.unknownError());
    } on firebase_auth.FirebaseAuthException catch (e) {
      _log.severe('Firebase exception during logInWithGoogle: $e');
      return Left(AuthenticationErrorFromFirebase.fromFirebaseException(e));
    } on Exception catch (e) {
      _log.warning('Unexpected logInWithGoogle Exception: $e');
      return const Left(AuthenticationError.unknownError());
    }
  }

  /// Signs out the current user which will emit `null` from the [users] Stream.
  ///
  /// Throws an [AuthenticationError] if an exception occurs.
  @override
  Future<Either<AuthenticationError, LogoutSentinel>> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
      _log.finer('Successfully logged out');
      return const Right(LogoutSentinel());
    } on Exception catch (e) {
      _log.severe('Logout exception: $e');
      return const Left(AuthenticationError.logoutError());
    }
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws an [AuthenticationError] if an exception occurs.
  @override
  Future<FirebaseUserOrError> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final userCred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.toLowerCase().trim(),
        password: password,
      );
      if (userCred.user != null) {
        return Right(userCred.user!);
      }
      _log.severe('signUp failed without throwing exception');
      return const Left(AuthenticationError.unknownError());
    } on firebase_auth.FirebaseAuthException catch (e) {
      _log.severe('Firebase exception during signUp: $e');
      return Left(AuthenticationErrorFromFirebase.fromFirebaseException(e));
    } on Exception catch (e) {
      _log.severe('Unexpected signUp Exception: $e');
      return const Left(AuthenticationError.unknownError());
    }
  }

  /// Pass-thru to the raw stream of `firebase_user.User` objects from Firebase
  /// Auth.
  @override
  Stream<FirebaseUser?> get users => _firebaseAuth.authStateChanges();

  @override
  Future<void> deleteUser(FirebaseUser user) {
    _log.warning('Deleting user ${user.uid}');
    return user.delete();
  }

  @override
  Future<FirebaseUserOrError> signInAnonymously() async {
    try {
      final userCred = await _firebaseAuth.signInAnonymously();
      if (userCred.user != null) {
        return Right(userCred.user!);
      }
      _log.severe('signInAnonymously failed without throwing exception');
      return const Left(AuthenticationError.unknownError());
    } on firebase_auth.FirebaseAuthException catch (e) {
      _log.severe('Firebase exception during signInAnonymously: $e');
      return Left(AuthenticationErrorFromFirebase.fromFirebaseException(e));
    } on Exception catch (e) {
      _log.severe('Unexpected signInAnonymously Exception: $e');
      return const Left(AuthenticationError.unknownError());
    }
  }
}

/// Converts raw Firebase login type strings to [AuthType] enum values.
Set<AuthType> loginTypesFromStrings(List<String> methods) {
  final types = <AuthType>{};

  for (final method in methods) {
    switch (method) {
      case 'google.com':
        types.add(AuthType.google);
      case 'apple.com':
        types.add(AuthType.apple);
      case 'email':
        types.add(AuthType.email);
      default:
        _log.shout('Invalid Firebase auth method: $method');
    }
  }
  return types;
}
