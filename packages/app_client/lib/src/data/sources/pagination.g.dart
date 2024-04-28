// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      pageSize: json['pageSize'] as int? ?? defaultPageSize,
      page: json['page'] as int? ?? 0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'runtimeType': instance.$type,
    };

_$PaginationByPageImpl _$$PaginationByPageImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationByPageImpl(
      json['page'] as int,
      pageSize: json['pageSize'] as int? ?? defaultPageSize,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PaginationByPageImplToJson(
        _$PaginationByPageImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'runtimeType': instance.$type,
    };
