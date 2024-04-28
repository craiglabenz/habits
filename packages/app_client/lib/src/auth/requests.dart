import 'dart:io';
import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';

/// {@template AuthenticatedReadApiRequest}
/// Read requests that require user authentication to complete successfully.
/// {@endtemplate}
class AuthenticatedReadApiRequest extends ReadApiRequest {
  /// {@macro AuthenticatedReadApiRequest}
  const AuthenticatedReadApiRequest({
    required this.apiKey,
    required super.url,
    super.headers,
    super.params,
  });

  /// The authenticated user behind this [ReadApiRequest].
  final String apiKey;

  @override
  Headers buildHeaders() {
    final headers = super.buildHeaders();
    headers[HttpHeaders.authorizationHeader] = 'Token $apiKey';
    return headers;
  }
}

/// {@template AuthenticatedReadApiRequest}
/// Read requests that require user authentication to complete successfully.
/// {@endtemplate}
class AuthenticatedWriteApiRequest extends WriteApiRequest {
  /// {@macro AuthenticatedWriteApiRequest}
  const AuthenticatedWriteApiRequest({
    required this.apiKey,
    required super.url,
    super.headers,
    super.body,
  });

  /// The authenticated user behind this [WriteApiRequest].
  final String apiKey;

  @override
  Headers buildHeaders() {
    final headers = super.buildHeaders();
    headers[HttpHeaders.authorizationHeader] = 'Token $apiKey';
    return headers;
  }
}

/// {@template LoginRequest}
/// Container for all information needed to login a user.
/// {@endtemplate}
class LoginRequest extends ReadApiRequest {
  /// {@macro LoginRequest}
  LoginRequest({
    required super.url,
    required String email,
    required String password,
  }) : super(params: {'email': email, 'password': password});
}

/// {@template RegisterRequest}
/// Container for all information needed to register a user.
/// {@endtemplate}
class RegisterRequest extends WriteApiRequest {
  /// {@macro RegisterRequest}
  RegisterRequest({
    required super.url,
    required String email,
    required String password,
  }) : super(body: {'email': email, 'password': password});
}

/// {@template LoadProfileRequest}
/// Container for all information needed to load an [AuthUser]'s [BaseUser].
/// {@endtemplate}
class LoadProfileRequest extends AuthenticatedReadApiRequest {
  /// {@macro LoadProfileRequest}
  const LoadProfileRequest({required super.url, required super.apiKey});
}

/// {@template UpdateProfileRequest}
/// Container for all information needed to save new info to an [AuthUser]'s
/// [BaseUser].
/// {@endtemplate}
class UpdateProfileRequest extends AuthenticatedWriteApiRequest {
  /// {@macro UpdateProfileRequest}
  UpdateProfileRequest({
    required super.url,
    required super.apiKey,
    required Json profile,
  }) : super(body: profile);
}
