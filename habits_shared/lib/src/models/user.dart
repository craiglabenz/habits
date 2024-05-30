import 'package:app_shared/app_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// {@template User}
/// {@endtemplate}
@Freezed()
class User with _$User {
  /// {@macro User}
  const factory User({
    required String uid,
    String? name,
    String? country,
    String? timezone,
  }) = _User;
  const User._();

  /// [Json] deserializer for [User].
  factory User.fromJson(Json json) => _$UserFromJson(json);
}

/// {@template UserConverter}
/// {@endtemplate}
class UserConverter implements JsonConverter<User, Json> {
  /// {@macro UserConverter}
  const UserConverter();

  @override
  User fromJson(Json json) => User.fromJson(json);

  @override
  Json toJson(User obj) => obj.toJson();
}
