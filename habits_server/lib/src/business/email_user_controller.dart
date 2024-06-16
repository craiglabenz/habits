import 'package:app_shared/app_shared.dart';
import 'package:habits_server/src/app_session/app_session.dart';
import 'package:habits_server/src/business/business.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

/// Performs operations on accounts authenticating with [AuthType.email]
/// credentials.
class EmailUserController {
  /// Method type for email authentication.
  static String methodName = AuthType.email.toJson();

  /// Adds email auth to an authenticated [UserInfo] account.
  static Future<AppAuthResponse> addAuth(
    AppSession appSession, {
    required String email,
    required String password,
  }) async {
    // Validate the validity of the email.
    final emError = EmailValidator.validate(email);
    if (emError != null) {
      return AppAuthFailure(reason: emError);
    }
    // Validate the health of the password.
    final pwValidator = PasswordValidator(password);
    final pwError = pwValidator.validate();
    if (pwError != null) {
      return AppAuthFailure(reason: pwError);
    }

    // Validate the session to which we are adding this email auth.
    final userInfoId = (await appSession.authenticated)!.userId;
    final authTypes = await AuthKeyController.getAuthTypesForUserId(
      appSession,
      userInfoId,
    );
    if (authTypes.contains(AuthType.email)) {
      appSession.log(
        'Attempted to add email auth to UserInfoId $userInfoId which already '
        'has an email auth AuthKey.',
        level: LogLevel.error,
      );
      return AppAuthFailure(
        reason: AuthenticationError.accountExists(
          fieldName: 'email',
          value: email,
        ),
      );
    }

    var emailAuth = await appSession.emailAuth.getByUserId(userInfoId);
    if (emailAuth != null) {
      appSession.log(
        'Attempted to add email auth to UserInfoId $userInfoId which already '
        'has an EmailAuth record.',
        level: LogLevel.error,
      );
      return AppAuthFailure(
        reason: AuthenticationError.accountExists(
          fieldName: 'email',
          value: email,
        ),
      );
    } else {
      emailAuth = EmailAuth(
        userId: userInfoId,
        email: email,
        hash: await appSession.emailAuth.generatePasswordHash(password),
      );
    }

    // Generate a new [AuthKey].
    final authKey = AuthKeyController.create(
      appSession,
      userId: userInfoId,
      methodName: methodName,
    );

    final successful = await appSession.transaction<bool>((transaction) async {
      try {
        // Throwing away result value here which technically could be used
        // in the return value because doing so would greatly complicate testing
        // this transaction.
        await appSession.emailAuth.insert(emailAuth!);
        await appSession.authKey.insert(
          authKey,
          transaction: transaction,
        );
        await appSession.userInfo.setEmail(
          userInfoId,
          email,
          transaction: transaction,
        );
        await appSession.authKey.deleteAnonymous(
          userInfoId,
          transaction: transaction,
        );
      } on Exception catch (e) {
        appSession.log(e.toString(), level: LogLevel.error);
        return false;
      }
      return true;
    });
    if (!successful) {
      const AppAuthFailure(reason: AuthenticationError.unknownError());
    }

    final resolvedFutures = await [
      // Load the new authKey we just made
      appSession.authKey.getTypedKeyForUserId(
        userInfoId,
        AuthType.email,
      ),
      // Load the UserInfo record
      appSession.userInfo.getById(userInfoId),
      // Load all keys
      AuthKeyController.getAuthTypesForUserId(
        appSession,
        userInfoId,
      ),
    ].wait;

    return AppAuthSuccess(
      keyId: (resolvedFutures[0]! as AuthKey).id!,
      key: authKey.key!,
      userInfoData: (resolvedFutures[1]! as UserInfo).toJson(),
      method: AuthType.email,
      allMethods: resolvedFutures[2]! as Set<AuthType>,
    );
  }
}
