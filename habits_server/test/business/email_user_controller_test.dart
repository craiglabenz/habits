import 'package:app_shared/app_shared.dart';
import 'package:habits_server/src/business/business.dart';
import 'package:mockito/mockito.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:test/test.dart';
import '../mocks/mocks.dart';

void main() {
  late MockAppSession appSession;
  late MockAuthKeyQueries authKey;
  late MockUserInfoQueries userInfo;
  late MockEmailAuthQueries emailAuth;

  setUp(() {
    appSession = MockAppSession();
    authKey = MockAuthKeyQueries();
    emailAuth = MockEmailAuthQueries();
    userInfo = MockUserInfoQueries();
  });

  group('EmailController.addAuth should', () {
    const goodEmail = 'some@email.com';
    const goodPw = '12345678';
    const badPw = '1234567';

    test('validate the password', () async {
      final response = await EmailUserController.addAuth(
        appSession,
        email: goodEmail,
        password: badPw,
      );
      expect(response, isA<AppAuthFailure>());
      expect((response as AppAuthFailure).reason, isA<InvalidPasswordError>());
    });

    test('validate the email', () async {
      final response = await EmailUserController.addAuth(
        appSession,
        email: 'asdf',
        password: goodPw,
      );
      expect(response, isA<AppAuthFailure>());
      expect((response as AppAuthFailure).reason, isA<InvalidEmailError>());
    });

    test('reject accounts that already have email auth', () async {
      when(appSession.authenticated).thenAnswer(
        (_) => Future.value(AuthenticationInfo(19, {})),
      );

      final mockAuthKey = MockAuthKey();
      when(mockAuthKey.method).thenReturn(AuthType.email.name);
      when(authKey.getAllForUserId(19)).thenAnswer(
        (_) => Future.value(<AuthKey>[mockAuthKey]),
      );
      when(appSession.authKey).thenReturn(authKey);

      final response = await EmailUserController.addAuth(
        appSession,
        email: goodEmail,
        password: goodPw,
      );
      expect(response, isA<AppAuthFailure>());
      expect((response as AppAuthFailure).reason, isA<AccountExistsError>());
    });

    test('should add email auth', () async {
      const userInfoId = 19;
      when(appSession.authenticated).thenAnswer(
        (_) => Future.value(AuthenticationInfo(userInfoId, {})),
      );

      final mockAnonymousKey = MockAuthKey();
      when(mockAnonymousKey.method).thenReturn(AuthType.anonymous.name);

      final mockEmailKey = MockAuthKey();
      when(mockEmailKey.method).thenReturn(AuthType.email.name);
      when(mockEmailKey.id).thenReturn(14);

      final getAllForUserIdResponses = <List<AuthKey>>[
        // Return for top of method to make sure account does not yet
        // have email auth
        <AuthKey>[mockAnonymousKey],
        // Return at end of method for `AppAuthSuccess`
        <AuthKey>[mockEmailKey],
      ];
      when(emailAuth.getByUserId(userInfoId)).thenAnswer(
        (_) => Future.value(/* null */),
      );
      when(emailAuth.generatePasswordHash(goodPw)).thenAnswer(
        (_) => Future.value('hashedPw'),
      );

      when(authKey.getAllForUserId(userInfoId)).thenAnswer(
        (_) => Future.value(getAllForUserIdResponses.removeAt(0)),
      );

      when(appSession.transaction<bool>(any)).thenAnswer(
        (_) => Future.value(true),
      );

      // Prepare values for final [AppAuthSuccess]
      when(authKey.getTypedKeyForUserId(userInfoId, AuthType.email))
          .thenAnswer((_) => Future.value(mockEmailKey));

      final mockUserInfo = MockUserInfo();
      when(mockUserInfo.toJson()).thenReturn({'very': 'serialized'});
      when(userInfo.getById(userInfoId))
          .thenAnswer((_) => Future.value(mockUserInfo));

      when(appSession.authKey).thenReturn(authKey);
      when(appSession.emailAuth).thenReturn(emailAuth);
      when(appSession.userInfo).thenReturn(userInfo);
      final response = await EmailUserController.addAuth(
        appSession,
        email: goodEmail,
        password: goodPw,
      );
      expect(response, isA<AppAuthSuccess>());
      final success = response as AppAuthSuccess;
      expect(success.keyId, equals(14));
      expect(success.key, isNotEmpty);
      expect(success.userInfoData, {'very': 'serialized'});
      expect(success.method, AuthType.email);
      expect(success.allMethods, {AuthType.email});
    });
  });
}
