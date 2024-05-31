import 'package:app_shared/app_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_auth_response.freezed.dart';
part 'app_auth_response.g.dart';

/// {@template AppAuthResponse}
///
/// {@endtemplate}
@Freezed()
class AppAuthResponse with _$AppAuthResponse {
  /// Response from a successful authentication attempt.
  const factory AppAuthResponse.success({
    required int keyId,
    required String key,
    required Json userInfoData,
    @AuthTypeConverter() required AuthType method,
    @AuthTypeListConverter() required List<AuthType> allMethods,
  }) = AppAuthSuccess;

  /// Response from an unsuccessful authentication attempt.
  const factory AppAuthResponse.failure({
    @AuthenticationErrorConverter() required AuthenticationError reason,
  }) = AppAuthFailure;
  const AppAuthResponse._();

  /// [Json] deserializer for [AppAuthResponse].
  factory AppAuthResponse.fromJson(Json json) =>
      _$AppAuthResponseFromJson(json);
}

/// {@template AppAuthResponseConverter}
/// {@endtemplate}
class AppAuthResponseConverter implements JsonConverter<AppAuthResponse, Json> {
  /// {@macro AppAuthResponseConverter}
  const AppAuthResponseConverter();

  @override
  AppAuthResponse fromJson(Json json) => AppAuthResponse.fromJson(json);

  @override
  Json toJson(AppAuthResponse obj) => obj.toJson();
}
