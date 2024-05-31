// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountExistsErrorImpl _$$AccountExistsErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountExistsErrorImpl(
      fieldName: json['fieldName'] as String,
      value: json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AccountExistsErrorImplToJson(
        _$AccountExistsErrorImpl instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$BadEmailPasswordErrorImpl _$$BadEmailPasswordErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$BadEmailPasswordErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BadEmailPasswordErrorImplToJson(
        _$BadEmailPasswordErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$BadApiKeyErrorImpl _$$BadApiKeyErrorImplFromJson(Map<String, dynamic> json) =>
    _$BadApiKeyErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BadApiKeyErrorImplToJson(
        _$BadApiKeyErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CancelledSocialAuthErrorImpl _$$CancelledSocialAuthErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$CancelledSocialAuthErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CancelledSocialAuthErrorImplToJson(
        _$CancelledSocialAuthErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$InvalidPasswordErrorImpl _$$InvalidPasswordErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$InvalidPasswordErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InvalidPasswordErrorImplToJson(
        _$InvalidPasswordErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$InvalidCodeErrorImpl _$$InvalidCodeErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$InvalidCodeErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InvalidCodeErrorImplToJson(
        _$InvalidCodeErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LogoutErrorImpl _$$LogoutErrorImplFromJson(Map<String, dynamic> json) =>
    _$LogoutErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LogoutErrorImplToJson(_$LogoutErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$MissingCredentialsImpl _$$MissingCredentialsImplFromJson(
        Map<String, dynamic> json) =>
    _$MissingCredentialsImpl(
      missingEmail: json['missingEmail'] as bool,
      missingPassword: json['missingPassword'] as bool,
      missingApiKey: json['missingApiKey'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MissingCredentialsImplToJson(
        _$MissingCredentialsImpl instance) =>
    <String, dynamic>{
      'missingEmail': instance.missingEmail,
      'missingPassword': instance.missingPassword,
      'missingApiKey': instance.missingApiKey,
      'runtimeType': instance.$type,
    };

_$WrongMethodImpl _$$WrongMethodImplFromJson(Map<String, dynamic> json) =>
    _$WrongMethodImpl(
      (json['methods'] as List<dynamic>)
          .map((e) => $enumDecode(_$AuthTypeEnumMap, e))
          .toSet(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WrongMethodImplToJson(_$WrongMethodImpl instance) =>
    <String, dynamic>{
      'methods': instance.methods.toList(),
      'runtimeType': instance.$type,
    };

const _$AuthTypeEnumMap = {
  AuthType.google: 'google',
  AuthType.apple: 'apple',
  AuthType.email: 'email',
  AuthType.anonymous: 'anonymous',
};

_$UnknownAuthErrorImpl _$$UnknownAuthErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$UnknownAuthErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnknownAuthErrorImplToJson(
        _$UnknownAuthErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
