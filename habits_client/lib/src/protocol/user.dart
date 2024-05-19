/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/module.dart' as _i2;

abstract class User extends _i1.SerializableEntity {
  User._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    required this.uid,
    this.name,
    this.country,
    this.timezone,
  });

  factory User({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required _i1.UuidValue uid,
    String? name,
    String? country,
    String? timezone,
  }) = _UserImpl;

  factory User.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return User(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userInfoId: serializationManager
          .deserialize<int>(jsonSerialization['userInfoId']),
      userInfo: serializationManager
          .deserialize<_i2.UserInfo?>(jsonSerialization['userInfo']),
      uid: serializationManager
          .deserialize<_i1.UuidValue>(jsonSerialization['uid']),
      name:
          serializationManager.deserialize<String?>(jsonSerialization['name']),
      country: serializationManager
          .deserialize<String?>(jsonSerialization['country']),
      timezone: serializationManager
          .deserialize<String?>(jsonSerialization['timezone']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  _i1.UuidValue uid;

  String? name;

  String? country;

  String? timezone;

  User copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    _i1.UuidValue? uid,
    String? name,
    String? country,
    String? timezone,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'uid': uid.toJson(),
      if (name != null) 'name': name,
      if (country != null) 'country': country,
      if (timezone != null) 'timezone': timezone,
    };
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required _i1.UuidValue uid,
    String? name,
    String? country,
    String? timezone,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          uid: uid,
          name: name,
          country: country,
          timezone: timezone,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    _i1.UuidValue? uid,
    Object? name = _Undefined,
    Object? country = _Undefined,
    Object? timezone = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      uid: uid ?? this.uid,
      name: name is String? ? name : this.name,
      country: country is String? ? country : this.country,
      timezone: timezone is String? ? timezone : this.timezone,
    );
  }
}
