import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';

/// {@template AuthUserBindings}
/// Data bindings for [AuthUser].
/// {@endtemplate}
class AuthUserBindings extends AuthBindings<AuthUser, String> {
  /// {@macro AuthUserBindings}
  const AuthUserBindings();
  @override
  AuthUser copy(AuthUser obj) => obj.copyWith();

  @override
  AuthUser fromJson(Json json) => AuthUser.fromJson(json);

  @override
  String getApiKey(AuthUser user) => user.apiKey;

  @override
  ApiUrl getDetailUrl(AuthUser obj) {
    // TODO: implement getDetailUrl
    throw UnimplementedError();
  }

  @override
  String? getId(AuthUser obj) => obj.id;

  @override
  ApiUrl getListUrl() {
    // TODO: implement getListUrl
    throw UnimplementedError();
  }

  @override
  Json toJson(AuthUser obj) => obj.toJson();
}
