import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:habits_client/habits_client.dart';
import 'package:serverpod_auth_client/module.dart' as serverpod_auth;

/// {@template ServerpodAuthService}
/// {@endtemplate}
class ServerpodAuthService<T, K> extends BaseRestAuth<T> {
  /// {@macro ServerpodAuthService}
  ServerpodAuthService(this.client, {required this.bindings});

  /// Generated Serverpod client.
  final Client client;

  /// Glue code for [T].
  AuthBindings<T, K> bindings;

  @override
  Future<UserOrError<T>> login({
    required String email,
    required String password,
  }) async {
    final st = DateTime.now();
    final authResponse =
        await client.modules.auth.email.authenticate(email, password);
    if (authResponse.success) {
      return Right(
        bindings.fromServerpod(
          authResponse.userInfo!,
          authResponse.key!,
        ),
      );
    } else {
      return Left(
        authErrorFromServerpod(
          response: authResponse,
          duration: DateTime.now().difference(st),
          url: client.modules.auth.email.name,
        ),
      );
    }
  }

  @override
  Future<UserOrError<T>> createAnonymous({
    required String firebaseUid,
    required String username,
  }) async {
    final st = DateTime.now();
    final authResponse = await client.appAuth.createAnonymous(
      userIdentifier: firebaseUid,
      username: username,
    );
    return authResponse.success //
        ? Right(
            bindings.fromServerpod(
              authResponse.userInfo!,
              authResponse.userInfo!.userIdentifier,
            ),
          )
        : Left(
            authErrorFromServerpod(
              response: authResponse,
              duration: DateTime.now().difference(st),
              url: 'client.appAuth.createAnonymous',
            ),
          );
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
