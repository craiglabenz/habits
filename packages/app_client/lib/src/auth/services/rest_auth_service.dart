import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';

final _log = Logger('auth.RestAuth');

/// Combination result type of authentication attempts.
typedef UserOrError<T> = Either<AuthenticationError, T>;

/// Handler for authentication set-up with the REST API.
///
/// Authorization is primarily handled with Firebase Auth, for the purposes of
/// social login, password resets, and other complicated machinery available
/// there. However, to then communicate with the REST API that powers the app,
/// successful Firebase authentication requests are synced here, creating
/// two active sessions.
abstract class BaseRestAuth<T> {
  /// Attempts to login the current user with the given [email] and [password].
  Future<UserOrError<T>> login({
    required String email,
    required String password,
  });

  /// Terminates any open session (probably by removing the User's api key from
  /// local storage).
  Future<void> logOut();

  /// Pulls a user's API key out of storage and verifies their session.
  Future<UserOrError<T>> checkSession();

  /// Attempts to register the new user with the given [email] and [password].
  Future<UserOrError<T>> register({
    required String email,
    required String password,
  });

  /// Creates a new anonymous account that the user may or may not one day
  /// upgrade.
  Future<UserOrError<T>> createAnonymous({required String firebaseUid});
}

/// {@template RestAuth}
/// Authentication bindings for the Django server. All authentication attempts
/// with this server happen after a successful authentication attempt with
/// Firebase.
/// {@endtemplate}
class RestAuth<T, K> implements BaseRestAuth<T> {
  /// {@macro RestAuth}
  RestAuth({
    required this.api,
    required this.bindings,
    required this.requestBuilder,
  });

  /// Network utility which puts authentication requests on the wire.
  final RestApi api;

  /// Bindings for app-specific logic which provides all the fields of a
  /// given app.
  final RestAuthRequestBuilder<T> requestBuilder;

  /// Glue code for the [T] type.
  final AuthBindings<T, K> bindings;

  @override
  Future<UserOrError<T>> login({
    required String email,
    required String password,
  }) async {
    final res = await api.get(
      requestBuilder.buildLoginRequest(email: email, password: password),
    );
    return res.map(
      success: (ApiSuccess res) => Right(
        bindings.fromJson(res.jsonOrRaise),
      ),
      error: (ApiError res) {
        _log.severe('Login Error ${res.url} :: ${res.errorString}');
        return Left(AuthenticationErrorFromApiError.fromApiError(res));
      },
    );
  }

  @override
  Future<UserOrError<T>> register({
    required String email,
    required String password,
  }) async {
    final res = await api.post(
      requestBuilder.buildRegisterRequest(email: email, password: password),
    );
    return res.map(
      success: (ApiSuccess res) => Right(
        bindings.fromJson(res.jsonOrRaise),
      ),
      error: (ApiError res) {
        _log.severe('Register Error ${res.url}: ${res.errorString}');
        return Left(AuthenticationErrorFromApiError.fromApiError(res));
      },
    );
  }

  @override
  Future<UserOrError<T>> createAnonymous({required String firebaseUid}) {
    // TODO: implement createAnonymous
    throw UnimplementedError();
  }

  @override
  Future<UserOrError<T>> checkSession() {
    // TODO: implement checkSession
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}

/// {@template RestAuthRequestBuilder}
/// Bindings for [RestAuth] to correctly communicate with the server.
/// {@endtemplate}
abstract class RestAuthRequestBuilder<T> {
  /// {@macro RestAuthRequestBuilder}
  const RestAuthRequestBuilder();

  /// Returns the [ApiUrl] to login a given user. This is paired with a GET
  /// request to the list endpoint and is thus the uri path is not dependent on
  /// the user.
  ApiUrl get loginUrl;

  /// Returns the [ApiUrl] to login a given user. This is paired with a POST
  /// request to the list endpoint and is thus the uri path is not dependent on
  /// the user.
  ApiUrl get registerUrl;

  /// Converts a String [email] and [password] into a [LoginRequest].
  LoginRequest buildLoginRequest({
    required String email,
    required String password,
  }) =>
      LoginRequest(url: loginUrl, email: email, password: password);

  /// Converts a String [email] and [password] into a [RegisterRequest].
  RegisterRequest buildRegisterRequest({
    required String email,
    required String password,
  }) =>
      RegisterRequest(url: registerUrl, email: email, password: password);
}
