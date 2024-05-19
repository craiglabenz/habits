/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'user.dart' as _i2;
import 'package:habits_shared/habits_shared.dart' as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.User) {
      return _i2.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.User?>()) {
      return (data != null ? _i2.User.fromJson(data) : null) as T;
    }
    if (t == _i3.UserFilter) {
      return _i3.UserFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.UserFilter?>()) {
      return (data != null ? _i3.UserFilter.fromJson(data) : null) as T;
    }
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i3.UserFilter) {
      return 'UserFilter';
    }
    if (data is _i2.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i4.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'UserFilter') {
      return deserialize<_i3.UserFilter>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i2.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
