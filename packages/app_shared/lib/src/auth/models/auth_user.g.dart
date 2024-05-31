// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthUserImpl _$$AuthUserImplFromJson(Map<String, dynamic> json) =>
    _$AuthUserImpl(
      id: json['id'] as String,
      apiKey: json['apiKey'] as String,
      method: $enumDecode(_$AuthTypeEnumMap, json['method']),
      allMethods: (json['allMethods'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AuthTypeEnumMap, e))
              .toList() ??
          const [],
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$AuthUserImplToJson(_$AuthUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apiKey': instance.apiKey,
      'method': instance.method,
      'allMethods': instance.allMethods,
      'email': instance.email,
    };

const _$AuthTypeEnumMap = {
  AuthType.google: 'google',
  AuthType.apple: 'apple',
  AuthType.email: 'email',
  AuthType.anonymous: 'anonymous',
};
