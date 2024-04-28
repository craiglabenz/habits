// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
mixin _$AppConfig {
  /// The upgrade URL for Android.
  String get androidUpgradeUrl => throw _privateConstructorUsedError;

  /// Whether the app is down for maintenance.
  bool get downForMaintenance => throw _privateConstructorUsedError;

  /// The upgrade URL for iOS.
  String get iosUpgradeUrl => throw _privateConstructorUsedError;

  /// The minimum supported build number for Android.
  int get minAndroidBuildNumber => throw _privateConstructorUsedError;

  /// The minimum supported build number for iOS.
  int get minIosBuildNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res, AppConfig>;
  @useResult
  $Res call(
      {String androidUpgradeUrl,
      bool downForMaintenance,
      String iosUpgradeUrl,
      int minAndroidBuildNumber,
      int minIosBuildNumber});
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res, $Val extends AppConfig>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidUpgradeUrl = null,
    Object? downForMaintenance = null,
    Object? iosUpgradeUrl = null,
    Object? minAndroidBuildNumber = null,
    Object? minIosBuildNumber = null,
  }) {
    return _then(_value.copyWith(
      androidUpgradeUrl: null == androidUpgradeUrl
          ? _value.androidUpgradeUrl
          : androidUpgradeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      downForMaintenance: null == downForMaintenance
          ? _value.downForMaintenance
          : downForMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      iosUpgradeUrl: null == iosUpgradeUrl
          ? _value.iosUpgradeUrl
          : iosUpgradeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      minAndroidBuildNumber: null == minAndroidBuildNumber
          ? _value.minAndroidBuildNumber
          : minAndroidBuildNumber // ignore: cast_nullable_to_non_nullable
              as int,
      minIosBuildNumber: null == minIosBuildNumber
          ? _value.minIosBuildNumber
          : minIosBuildNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigImplCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$$AppConfigImplCopyWith(
          _$AppConfigImpl value, $Res Function(_$AppConfigImpl) then) =
      __$$AppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String androidUpgradeUrl,
      bool downForMaintenance,
      String iosUpgradeUrl,
      int minAndroidBuildNumber,
      int minIosBuildNumber});
}

/// @nodoc
class __$$AppConfigImplCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$AppConfigImpl>
    implements _$$AppConfigImplCopyWith<$Res> {
  __$$AppConfigImplCopyWithImpl(
      _$AppConfigImpl _value, $Res Function(_$AppConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidUpgradeUrl = null,
    Object? downForMaintenance = null,
    Object? iosUpgradeUrl = null,
    Object? minAndroidBuildNumber = null,
    Object? minIosBuildNumber = null,
  }) {
    return _then(_$AppConfigImpl(
      androidUpgradeUrl: null == androidUpgradeUrl
          ? _value.androidUpgradeUrl
          : androidUpgradeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      downForMaintenance: null == downForMaintenance
          ? _value.downForMaintenance
          : downForMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      iosUpgradeUrl: null == iosUpgradeUrl
          ? _value.iosUpgradeUrl
          : iosUpgradeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      minAndroidBuildNumber: null == minAndroidBuildNumber
          ? _value.minAndroidBuildNumber
          : minAndroidBuildNumber // ignore: cast_nullable_to_non_nullable
              as int,
      minIosBuildNumber: null == minIosBuildNumber
          ? _value.minIosBuildNumber
          : minIosBuildNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigImpl implements _AppConfig {
  const _$AppConfigImpl(
      {this.androidUpgradeUrl = '',
      this.downForMaintenance = false,
      this.iosUpgradeUrl = '',
      this.minAndroidBuildNumber = 1,
      this.minIosBuildNumber = 1});

  factory _$AppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigImplFromJson(json);

  /// The upgrade URL for Android.
  @override
  @JsonKey()
  final String androidUpgradeUrl;

  /// Whether the app is down for maintenance.
  @override
  @JsonKey()
  final bool downForMaintenance;

  /// The upgrade URL for iOS.
  @override
  @JsonKey()
  final String iosUpgradeUrl;

  /// The minimum supported build number for Android.
  @override
  @JsonKey()
  final int minAndroidBuildNumber;

  /// The minimum supported build number for iOS.
  @override
  @JsonKey()
  final int minIosBuildNumber;

  @override
  String toString() {
    return 'AppConfig(androidUpgradeUrl: $androidUpgradeUrl, downForMaintenance: $downForMaintenance, iosUpgradeUrl: $iosUpgradeUrl, minAndroidBuildNumber: $minAndroidBuildNumber, minIosBuildNumber: $minIosBuildNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigImpl &&
            (identical(other.androidUpgradeUrl, androidUpgradeUrl) ||
                other.androidUpgradeUrl == androidUpgradeUrl) &&
            (identical(other.downForMaintenance, downForMaintenance) ||
                other.downForMaintenance == downForMaintenance) &&
            (identical(other.iosUpgradeUrl, iosUpgradeUrl) ||
                other.iosUpgradeUrl == iosUpgradeUrl) &&
            (identical(other.minAndroidBuildNumber, minAndroidBuildNumber) ||
                other.minAndroidBuildNumber == minAndroidBuildNumber) &&
            (identical(other.minIosBuildNumber, minIosBuildNumber) ||
                other.minIosBuildNumber == minIosBuildNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      androidUpgradeUrl,
      downForMaintenance,
      iosUpgradeUrl,
      minAndroidBuildNumber,
      minIosBuildNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      __$$AppConfigImplCopyWithImpl<_$AppConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigImplToJson(
      this,
    );
  }
}

abstract class _AppConfig implements AppConfig {
  const factory _AppConfig(
      {final String androidUpgradeUrl,
      final bool downForMaintenance,
      final String iosUpgradeUrl,
      final int minAndroidBuildNumber,
      final int minIosBuildNumber}) = _$AppConfigImpl;

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$AppConfigImpl.fromJson;

  @override

  /// The upgrade URL for Android.
  String get androidUpgradeUrl;
  @override

  /// Whether the app is down for maintenance.
  bool get downForMaintenance;
  @override

  /// The upgrade URL for iOS.
  String get iosUpgradeUrl;
  @override

  /// The minimum supported build number for Android.
  int get minAndroidBuildNumber;
  @override

  /// The minimum supported build number for iOS.
  int get minIosBuildNumber;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
