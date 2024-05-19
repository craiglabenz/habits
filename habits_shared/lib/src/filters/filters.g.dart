// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AndUserFilterImpl _$$AndUserFilterImplFromJson(Map<String, dynamic> json) =>
    _$AndUserFilterImpl(
      (json['children'] as List<dynamic>)
          .map((e) => UserFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AndUserFilterImplToJson(_$AndUserFilterImpl instance) =>
    <String, dynamic>{
      'children': instance.children,
      'runtimeType': instance.$type,
    };

_$OrUserFilterImpl _$$OrUserFilterImplFromJson(Map<String, dynamic> json) =>
    _$OrUserFilterImpl(
      (json['children'] as List<dynamic>)
          .map((e) => UserFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OrUserFilterImplToJson(_$OrUserFilterImpl instance) =>
    <String, dynamic>{
      'children': instance.children,
      'runtimeType': instance.$type,
    };

_$UidEqualsUserFilterImpl _$$UidEqualsUserFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$UidEqualsUserFilterImpl(
      json['uid'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UidEqualsUserFilterImplToJson(
        _$UidEqualsUserFilterImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'runtimeType': instance.$type,
    };
