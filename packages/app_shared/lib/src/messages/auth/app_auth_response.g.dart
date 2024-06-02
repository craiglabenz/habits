// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppAuthSuccessImpl _$$AppAuthSuccessImplFromJson(Map<String, dynamic> json) =>
    _$AppAuthSuccessImpl(
      keyId: (json['keyId'] as num).toInt(),
      key: json['key'] as String,
      userInfoData: json['userInfoData'] as Map<String, dynamic>,
      method: const AuthTypeConverter().fromJson(json['method'] as String),
      allMethods:
          const AuthTypeListConverter().fromJson(json['allMethods'] as List),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppAuthSuccessImplToJson(
        _$AppAuthSuccessImpl instance) =>
    <String, dynamic>{
      'keyId': instance.keyId,
      'key': instance.key,
      'userInfoData': instance.userInfoData,
      'method': const AuthTypeConverter().toJson(instance.method),
      'allMethods': const AuthTypeListConverter().toJson(instance.allMethods),
      'runtimeType': instance.$type,
    };

_$AppAuthFailureImpl _$$AppAuthFailureImplFromJson(Map<String, dynamic> json) =>
    _$AppAuthFailureImpl(
      reason: const AuthenticationErrorConverter()
          .fromJson(json['reason'] as Map<String, Object?>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppAuthFailureImplToJson(
        _$AppAuthFailureImpl instance) =>
    <String, dynamic>{
      'reason': const AuthenticationErrorConverter().toJson(instance.reason),
      'runtimeType': instance.$type,
    };
