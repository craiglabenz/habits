import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';

/// Fake [BaseUser] implementation.
class FakeUser extends BaseUser {
  /// Fake [BaseUser] implementation.
  FakeUser({
    required this.id,
    required this.username,
  }) : createdAt = DateTime.now();

  /// Json deserializer for fake [BaseUser] implementation.
  factory FakeUser.fromJson(Json json) => FakeUser(
        id: json['id']! as String,
        username: json['username']! as String,
      );

  @override
  final String? id;

  @override
  final String username;

  @override
  final DateTime createdAt;

  @override
  Json toJson() => {'id': id, 'username': username};
}

/// Fake bindings for an [AuthRepository].
class FakeUserRequestBuilder<T> extends RestAuthRequestBuilder<T> {
  /// Fake bindings for an [AuthRepository].
  const FakeUserRequestBuilder();

  @override
  ApiUrl get loginUrl => const ApiUrl(path: 'login');

  @override
  ApiUrl get registerUrl => const ApiUrl(path: 'register');
}

/// Stub bindings for [AuthUser].
class FakeAuthUserBindings extends AuthBindings<AuthUser, String> {
  @override
  AuthUser copy(AuthUser obj) => AuthUser.fromJson(obj.toJson());

  @override
  AuthUser fromJson(Json json) => AuthUser.fromJson(json);

  @override
  String getApiKey(AuthUser user) => user.apiKey;

  @override
  ApiUrl getDetailUrl(AuthUser obj) => ApiUrl(path: 'fake-users/${obj.id}');

  @override
  String? getId(AuthUser obj) => obj.id;

  @override
  ApiUrl getListUrl() => const ApiUrl(path: 'fake-users');

  @override
  Json toJson(AuthUser obj) => obj.toJson();

  @override
  AuthUser get unknownUser => AuthUser.unknown;
}
