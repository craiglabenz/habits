// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigImpl _$$AppConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigImpl(
      androidUpgradeUrl: json['androidUpgradeUrl'] as String? ?? '',
      downForMaintenance: json['downForMaintenance'] as bool? ?? false,
      iosUpgradeUrl: json['iosUpgradeUrl'] as String? ?? '',
      minAndroidBuildNumber: json['minAndroidBuildNumber'] as int? ?? 1,
      minIosBuildNumber: json['minIosBuildNumber'] as int? ?? 1,
    );

Map<String, dynamic> _$$AppConfigImplToJson(_$AppConfigImpl instance) =>
    <String, dynamic>{
      'androidUpgradeUrl': instance.androidUpgradeUrl,
      'downForMaintenance': instance.downForMaintenance,
      'iosUpgradeUrl': instance.iosUpgradeUrl,
      'minAndroidBuildNumber': instance.minAndroidBuildNumber,
      'minIosBuildNumber': instance.minIosBuildNumber,
    };
