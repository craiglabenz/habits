// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvalidApiKeyImpl _$$InvalidApiKeyImplFromJson(Map<String, dynamic> json) =>
    _$InvalidApiKeyImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InvalidApiKeyImplToJson(_$InvalidApiKeyImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$InvalidEmailImpl _$$InvalidEmailImplFromJson(Map<String, dynamic> json) =>
    _$InvalidEmailImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InvalidEmailImplToJson(_$InvalidEmailImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PasswordTooShortImpl _$$PasswordTooShortImplFromJson(
        Map<String, dynamic> json) =>
    _$PasswordTooShortImpl(
      json['minimumLength'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PasswordTooShortImplToJson(
        _$PasswordTooShortImpl instance) =>
    <String, dynamic>{
      'minimumLength': instance.minimumLength,
      'runtimeType': instance.$type,
    };
