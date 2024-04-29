import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:serverpod_auth_client/module.dart' as serverpod_auth;

/// {@template AuthBindings}
/// Enhanced version of [Bindings] for auth-specific concerns.
/// {@endtemplate}
abstract class AuthBindings<T, K> extends Bindings<T, K> {
  /// {@macro AuthBindings}
  const AuthBindings();

  /// Function which can return the [String] api key for the given user.
  String getApiKey(AuthUser user);

  /// Converts a Serverpod [serverpod_auth.UserInfo] object into [T].
  T fromServerpod(serverpod_auth.UserInfo userInfo, String apiKey) {
    // TODO: Add tests for this!
    final json = <String, Object?>{
      'id': userInfo.userIdentifier,
      'apiKey': apiKey,
      'email': userInfo.email,
    };
    return fromJson(json);
  }
}
