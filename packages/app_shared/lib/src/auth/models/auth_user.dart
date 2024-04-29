import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

/// {@template AuthUser}
/// Container for the active user's information. Only used for authorization and
/// permission things; the active user is likely to also appear in the set of
/// [BaseUser] objects.
///
/// It is typical for applications to add an extension method to [AuthUser]
/// which loads that application's concrete version of [BaseUser]. Such an
/// extension method may look like this:
///
/// ```dart
/// RelatedUser get user => RelatedModel<User>(id, repository: ...);
/// ```
///
/// See also:
///   [BaseUser] - The container for users of the app regardless of whether or
///                not they are the active user.
/// {@endtemplate}
@Freezed()
class AuthUser extends Model<String> with _$AuthUser {
  /// {@macro AuthUser}
  const factory AuthUser({
    required String id,
    required String apiKey,
    String? email,
  }) = _AuthUser;

  const AuthUser._();

  /// Deserializes a raw data into an [AuthUser] instance.
  factory AuthUser.fromJson(Json json) => _$AuthUserFromJson(json);

  /// Anonymous user which represents an unauthenticated user.
  static const anonymous = AuthUser(id: 'anonymous', apiKey: 'anonymous');
}

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

/// {@template BaseUser}
/// Container for all users of the app in relation to activities like posts,
/// likes, or similar.
///
/// Apps should extend this class with their own `User` model and supply that
/// as the generic type whenever they see `Class<T extends BaseUser>`.
/// {@endtemplate}
abstract class BaseUser<K> extends CreatedAtModel<K> {
  /// {@macro BaseUser}
  const BaseUser();

  /// Social handle of this [BaseUser] in the app.
  String get username;
}
