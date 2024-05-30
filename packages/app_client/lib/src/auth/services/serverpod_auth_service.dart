import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_client/habits_client.dart';
import 'package:serverpod_auth_client/module.dart' as serverpod_auth;
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

/// {@template ServerpodAuthService}
/// {@endtemplate}
class ServerpodAuthService<T, K> extends BaseRestAuth<T> {
  /// {@macro ServerpodAuthService}
  ServerpodAuthService({
    Client? client,
    AuthBindings<T, K>? bindings,
    SessionManager? sessionManager,
  })  : _client = client ?? GetIt.I<Client>(),
        _bindings = bindings ?? GetIt.I<AuthBindings<T, K>>(),
        _sessionManager = sessionManager ?? GetIt.I<SessionManager>();

  final _logger = AppLogger('ServerpodAuthService');

  /// Generated Serverpod client.
  final Client _client;

  /// Reference to Serverpod tool which signs requests with the authenticated
  /// user's information.
  final SessionManager _sessionManager;

  /// Glue code for [T].
  final AuthBindings<T, K> _bindings;

  @override
  Future<UserOrError<T>> checkSession() async {
    final st = DateTime.now();
    final keyIdentifier = await _client.authenticationKeyManager?.get();
    _logger.finest('KeyIdentifier :: $keyIdentifier');
    if (keyIdentifier == null) {
      return Right(_bindings.unknownUser);
    }
    final authResponse = await _client.appAuth.checkSession(
      keyIdentifier: keyIdentifier,
    );
    return _processResponse(authResponse, 'appAuth.checkSession', st);
  }

  @override
  Future<UserOrError<T>> login({
    required String email,
    required String password,
  }) async {
    final st = DateTime.now();
    final authResponse = await _client.modules.auth.email.authenticate(
      email,
      password,
    );
    return _processResponse(authResponse, _client.modules.auth.email.name, st);
  }

  @override
  Future<UserOrError<T>> createAnonymous({required String firebaseUid}) async {
    final st = DateTime.now();
    final authResponse = await _client.appAuth.createAnonymous(
      userIdentifier: firebaseUid,
    );
    return _processResponse(authResponse, 'appAuth.createAnonymous', st);
  }

  Future<UserOrError<T>> _processResponse(
    AuthenticationResponse authResponse,
    String url,
    DateTime start,
  ) async {
    if (authResponse.success) {
      _logger
        ..fine('AuthResponse success')
        ..finest('• AuthResponse.userInfo: ${authResponse.userInfo!}')
        ..finest('• AuthResponse.keyId: ${authResponse.keyId!}')
        ..finest('• AuthResponse.key: ${authResponse.key!}');
      await _sessionManager.registerSignedInUser(
        authResponse.userInfo!,
        authResponse.keyId!,
        authResponse.key!,
      );

      return Right(
        _bindings.fromServerpod(
          authResponse.userInfo!,
          authResponse.key!,
        ),
      );
    } else {
      return Left(
        authErrorFromServerpod(
          response: authResponse,
          duration: DateTime.now().difference(start),
          url: url,
        ),
      );
    }
  }

  @override
  Future<UserOrError<T>> register({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError(
      'Users should be created first as anonymous sessions and then upgraded '
      'to full accounts',
    );
    // final st = DateTime.now();
    // final authResponse =
    //     await client.modules.auth.email.register(email, password);
    // if (authResponse.success) {
    //   return Right(
    //     authUserFromServerpod(
    //       authResponse.userInfo!,
    //       authResponse.key!,
    //     ),
    //   );
    // } else {
    //   return Left(
    //     authErrorFromServerpod(
    //       response: authResponse,
    //       duration: DateTime.now().difference(st),
    //       url: client.modules.auth.email.name,
    //     ),
    //   );
    // }
  }

  @override
  Future<void> logOut() async => _client.authenticationKeyManager?.remove();
}

/// Converts a Serverpod [serverpod_auth.UserInfo] object into the app's
/// auth'ed user class, [AuthUser].
AuthUser authUserFromServerpod(
  serverpod_auth.UserInfo serverpodUser,
  String apiKey,
) =>
    AuthUser(
      id: serverpodUser.userIdentifier,
      apiKey: apiKey,
      email: serverpodUser.email,
    );

/// Converts a Serverpod [serverpod_auth.AuthenticationResponse] object into
/// the app's authentication error class, [AuthenticationError].
AuthenticationError authErrorFromServerpod({
  required serverpod_auth.AuthenticationResponse response,
  required Duration duration,
  required String url,
}) {
  assert(
    !response.success,
    'Cannot convert successful AuthenticationResponse into an error',
  );
  return switch (response.failReason!) {
    serverpod_auth.AuthenticationFailReason.invalidCredentials =>
      const AuthenticationError.badEmailPassword(),
    serverpod_auth.AuthenticationFailReason.userCreationDenied =>
      const AuthenticationError.emailTaken(),
    serverpod_auth.AuthenticationFailReason.internalError =>
      AuthenticationError.fromApiError(
        ApiError(
          error: const ErrorMessage.fromString('Internal server error'),
          statusCode: 500,
          responseTime: duration,
          url: url,
        ),
      ),
    serverpod_auth.AuthenticationFailReason.tooManyFailedAttempts =>
      AuthenticationError.fromApiError(
        ApiError(
          error: const ErrorMessage.fromString('Too many failed attempts'),
          statusCode: 500,
          responseTime: duration,
          url: url,
        ),
      ),
    serverpod_auth.AuthenticationFailReason.blocked =>
      const AuthenticationError.unknownError(),
  };
}
