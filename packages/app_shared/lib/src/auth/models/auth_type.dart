/// Flavor of user auth action taking place.
enum AuthType {
  /// Sessions powered by Google SSO.
  google,

  /// Sessions powered by Apple SSO.
  apple,

  /// Sessions powered by email and password.
  email,

  /// Creating an anonymous session which cannot be restored without being
  /// upgraded.
  anonymous;

  /// Json deserializer.
  static AuthType fromJson(String name) => AuthType.values.asNameMap()[name]!;

  /// Json serializer.
  String toJson() => name;
}
