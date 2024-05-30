/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'model_enum.dart' as _i2;
import 'not_found_exception.dart' as _i3;
import 'package:habits_shared/habits_shared.dart' as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
export 'model_enum.dart';
export 'not_found_exception.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Model) {
      return _i2.Model.fromJson(data) as T;
    }
    if (t == _i3.NotFoundException) {
      return _i3.NotFoundException.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Model?>()) {
      return (data != null ? _i2.Model.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.NotFoundException?>()) {
      return (data != null ? _i3.NotFoundException.fromJson(data) : null) as T;
    }
    if (t == _i4.User) {
      return _i4.User.fromJson(data) as T;
    }
    if (t == _i4.UserFilter) {
      return _i4.UserFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.User?>()) {
      return (data != null ? _i4.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.UserFilter?>()) {
      return (data != null ? _i4.UserFilter.fromJson(data) : null) as T;
    }
    try {
      return _i5.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i5.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i4.User) {
      return 'User';
    }
    if (data is _i4.UserFilter) {
      return 'UserFilter';
    }
    if (data is _i2.Model) {
      return 'Model';
    }
    if (data is _i3.NotFoundException) {
      return 'NotFoundException';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i5.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'User') {
      return deserialize<_i4.User>(data['data']);
    }
    if (data['className'] == 'UserFilter') {
      return deserialize<_i4.UserFilter>(data['data']);
    }
    if (data['className'] == 'Model') {
      return deserialize<_i2.Model>(data['data']);
    }
    if (data['className'] == 'NotFoundException') {
      return deserialize<_i3.NotFoundException>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
