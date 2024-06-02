/// JsonConverters for classes generated by Serverpod.
library;

import 'package:app_shared/app_shared.dart';
import 'package:json_annotation/json_annotation.dart';

/// {@template AuthTypeConverter}
/// {@endtemplate}
class AuthTypeConverter extends JsonConverter<AuthType, String> {
  /// {@macro AuthTypeConverter}
  const AuthTypeConverter();

  @override
  AuthType fromJson(String json) => AuthType.fromJson(json);

  @override
  String toJson(AuthType object) => object.toJson();
}

/// {@template AuthTypeListConverter}
/// {@endtemplate}
class AuthTypeListConverter
    extends JsonConverter<List<AuthType>, List<dynamic>> {
  /// {@macro AuthTypeListConverter}
  const AuthTypeListConverter();

  @override
  List<AuthType> fromJson(List<dynamic> json) => json
      .cast<String>()
      .map<AuthType>((index) => const AuthTypeConverter().fromJson(index))
      .toList();

  @override
  List<String> toJson(List<AuthType> object) => object
      .map<String>((obj) => const AuthTypeConverter().toJson(obj))
      .toList();
}

/// {@template AuthenticationErrorConverter}
/// {@endtemplate}
class AuthenticationErrorConverter
    extends JsonConverter<AuthenticationError, Json> {
  /// {@macro AuthenticationErrorConverter}
  const AuthenticationErrorConverter();

  @override
  AuthenticationError fromJson(Json json) => AuthenticationError.fromJson(json);

  @override
  Json toJson(AuthenticationError object) => object.toJson();
}
