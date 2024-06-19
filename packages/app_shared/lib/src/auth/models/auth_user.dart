import 'package:app_shared/app_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

/// {@template AuthUser}
/// Container for the active user's information. Only used for authorization and
/// permission things; the active user is likely to also appear in the set of
/// `User` objects.
///
/// It is typical for applications to add an extension method to [AuthUser]
/// which loads that application's concrete version of `User`. Such an
/// extension method may look like this:
///
/// ```dart
/// RelatedUser get user => RelatedModel<User>(id);
/// ```
///
/// See also:
///  User - The container for users of the app regardless of whether or
///         not they are the active user.
/// {@endtemplate}
@Freezed()
class AuthUser extends StringModel with _$AuthUser {
  /// {@macro AuthUser}
  const factory AuthUser({
    required String id,
    required String apiKey,

    /// Auth mechanism used to create and restore this session. Allowed values
    /// are from [AuthType].
    required AuthType method,

    /// All active mechanisms used for this account. Allowed values are from
    /// [AuthType].
    required List<AuthType> allMethods,
    String? email,
  }) = _AuthUser;

  const AuthUser._();

  /// Deserializes a raw data into an [AuthUser] instance.
  factory AuthUser.fromJson(Json json) => _$AuthUserFromJson(json);

  /// Unknown user which represents an unauthenticated user.
  static const unknown = AuthUser(
    id: 'unknown',
    apiKey: '---',
    // TODO: Using [AuthType.anonymous] here is confusing.
    method: AuthType.anonymous,
    allMethods: [AuthType.anonymous],
  );

  /// True if this [AuthUser] is [AuthUser.unknown].
  bool get isUnknown => this == unknown;

  /// True is this [AuthUser] is not [AuthUser.unknown].
  bool get isKnown => this != unknown;

  /// True if this [AuthUser] can authenticate with an email and password.
  bool get hasEmailAuth => allMethods.contains(AuthType.email);

  /// True if this [AuthUser] can authenticate with Apple or Google.
  bool get hasSocialAuth =>
      allMethods.contains(AuthType.apple) ||
      allMethods.contains(AuthType.google);
}
