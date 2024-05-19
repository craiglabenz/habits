import 'package:app_shared/app_shared.dart';

/// Simple, abstract version of an app's "user", for interfaces and tests.
abstract class BaseUser extends CreatedAtModel<String> {
  /// Const constructor so descendants can also have const constructors.
  const BaseUser();

  /// Primary key.
  @override
  String? get id;

  /// Username.
  String get username;

  /// Timestamp of origin.
  @override
  DateTime get createdAt;
}
