// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AndPostFilterImpl _$$AndPostFilterImplFromJson(Map<String, dynamic> json) =>
    _$AndPostFilterImpl(
      (json['children'] as List<dynamic>)
          .map((e) => PostFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AndPostFilterImplToJson(_$AndPostFilterImpl instance) =>
    <String, dynamic>{
      'children': instance.children,
      'runtimeType': instance.$type,
    };

_$OrPostFilterImpl _$$OrPostFilterImplFromJson(Map<String, dynamic> json) =>
    _$OrPostFilterImpl(
      (json['children'] as List<dynamic>)
          .map((e) => PostFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OrPostFilterImplToJson(_$OrPostFilterImpl instance) =>
    <String, dynamic>{
      'children': instance.children,
      'runtimeType': instance.$type,
    };

_$PostFilterCreatedAfterImpl _$$PostFilterCreatedAfterImplFromJson(
        Map<String, dynamic> json) =>
    _$PostFilterCreatedAfterImpl(
      DateTime.parse(json['value'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PostFilterCreatedAfterImplToJson(
        _$PostFilterCreatedAfterImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$PostFilterCreatedBeforeImpl _$$PostFilterCreatedBeforeImplFromJson(
        Map<String, dynamic> json) =>
    _$PostFilterCreatedBeforeImpl(
      DateTime.parse(json['value'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PostFilterCreatedBeforeImplToJson(
        _$PostFilterCreatedBeforeImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$PostFilterBodyContainsImpl _$$PostFilterBodyContainsImplFromJson(
        Map<String, dynamic> json) =>
    _$PostFilterBodyContainsImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PostFilterBodyContainsImplToJson(
        _$PostFilterBodyContainsImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };
