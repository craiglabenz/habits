// ignore_for_file: unnecessary_lambdas

import 'package:app_shared/app_shared.dart';
import 'package:habits_server/src/business/business.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import '../mocks.dart';

void main() {
  late MockAppSession appSession;
  late MockAuthKeyQueries authKey;
  late MockUserInfoQueries userInfo;
  late MockUserQueries user;

  setUpAll(() {
    registerFallbackValue(FakeUserInfo());
    registerFallbackValue(FakeAuthKey());
    registerFallbackValue(FakeProtocolUser());
  });

  setUp(() {
    appSession = MockAppSession();
    authKey = MockAuthKeyQueries();
    userInfo = MockUserInfoQueries();
    user = MockUserQueries();
  });

  group('AnonymousUserController.createAccount should', () {
    test('return an AppAuthFailure for existing accounts', () async {
      when(() => appSession.userInfo).thenReturn(userInfo);
      when(() => userInfo.getByUserIdentifier('abc')).thenAnswer(
        (_) async => MockUserInfo(),
      );
      final authResponse = await AnonymousUserController.createAccount(
        appSession,
        userIdentifier: 'abc',
        key: 'key',
      );
      expect(authResponse, isA<AppAuthFailure>());
      final failure = authResponse as AppAuthFailure;
      expect(failure.reason, isA<AccountExistsError>());
      expect(
        (failure.reason as AccountExistsError).fieldName,
        'userIdentifier',
      );
    });

    test('save all data object when account is new', () async {
      when(() => appSession.hashString('key')).thenReturn('_hashed_');
      when(() => appSession.authKey).thenReturn(authKey);
      when(() => appSession.userInfo).thenReturn(userInfo);
      when(() => appSession.user).thenReturn(user);
      when(() => user.insert(any())).thenAnswer(
        (_) async => MockProtocolUser(),
      );

      // Setup saved UserInfo
      final userInfoJson = {'id': 5, 'userIdentifier': 'abc'};
      final savedUserInfo = MockUserInfo();
      when(() => savedUserInfo.id).thenReturn(5);
      //
      when(() => savedUserInfo.toJson()).thenReturn(userInfoJson);
      when(() => userInfo.insert(any(), 'anonymous'))
          .thenAnswer((_) async => savedUserInfo);

      // Setup saved AuthKey
      final savedAuthKey = MockAuthKey();
      when(() => savedAuthKey.id).thenReturn(11);
      when(() => authKey.insert(any())).thenAnswer((_) async => savedAuthKey);
      when(() => userInfo.getByUserIdentifier('abc')).thenAnswer(
        (_) async => null,
      );
      final authResponse = await AnonymousUserController.createAccount(
        appSession,
        userIdentifier: 'abc',
        key: 'key',
      );
      verify(() => authKey.insert(any())).called(1);
      verify(() => userInfo.insert(any(), 'anonymous')).called(1);
      verify(() => user.insert(any())).called(1);
      expect(authResponse, isA<AppAuthSuccess>());
      final success = authResponse as AppAuthSuccess;
      expect(success.userInfoData, userInfoJson);
      expect(success.keyId, 11);
      expect(success.method, AuthType.anonymous);
      expect(success.allMethods, [AuthType.anonymous]);
    });
  });

  group('AnonymousUserController.checkSession should', () {
    test('return an error for an unknown key', () async {
      final keyValidator = MockKeyValidator();
      when(() => keyValidator.validate()).thenReturn(null);
      when(() => keyValidator.keyId).thenReturn(5);
      when(() => appSession.getKeyValidator('5:abc')).thenReturn(keyValidator);
      when(() => appSession.authKey).thenReturn(authKey);
      when(() => authKey.getById(5)).thenAnswer((_) async => null);
      final response = await AnonymousUserController.checkSession(
        appSession,
        keyIdentifier: '5:abc',
      );
      expect(response, isA<AppAuthFailure>());
      expect((response as AppAuthFailure).reason, isA<BadApiKeyError>());
      verify(() => keyValidator.validate()).called(1);
    });

    test('return an error for a bad hash', () async {
      when(() => appSession.hashString('xyz')).thenReturn('_hashed_');
      when(() => appSession.authKey).thenReturn(authKey);

      final keyValidator = MockKeyValidator();
      when(() => keyValidator.validate()).thenReturn(null);
      when(() => keyValidator.keyId).thenReturn(5);
      when(() => keyValidator.key).thenReturn('xyz');
      when(() => appSession.getKeyValidator('5:xyz')).thenReturn(keyValidator);

      final savedAuthKey = MockAuthKey();
      when(() => savedAuthKey.hash).thenReturn('_wrong_hash_');
      when(() => authKey.getById(5)).thenAnswer((_) async => savedAuthKey);
      final response = await AnonymousUserController.checkSession(
        appSession,
        keyIdentifier: '5:xyz',
      );
      expect(response, isA<AppAuthFailure>());
      expect((response as AppAuthFailure).reason, isA<BadApiKeyError>());
    });

    test('return a session for a good key', () async {
      final keyValidator = MockKeyValidator();
      when(() => keyValidator.validate()).thenReturn(null);
      when(() => keyValidator.keyId).thenReturn(5);
      when(() => keyValidator.key).thenReturn('xyz');
      when(() => appSession.getKeyValidator('5:xyz')).thenReturn(keyValidator);

      when(() => appSession.hashString('xyz')).thenReturn('_hashed_');
      when(() => appSession.authKey).thenReturn(authKey);
      when(() => appSession.userInfo).thenReturn(userInfo);

      // Set up UserInfo for key
      final userInfoObj = MockUserInfo();
      final Json userInfoJson = {'id': 10};
      when(() => userInfoObj.toJson()).thenReturn(userInfoJson);
      when(() => userInfo.getById(10)).thenAnswer((_) async => userInfoObj);

      // Set up AuthKey loading
      final savedAuthKey = MockAuthKey();
      when(() => savedAuthKey.id).thenReturn(5);
      when(() => savedAuthKey.hash).thenReturn('_hashed_');
      when(() => savedAuthKey.userId).thenReturn(10);
      when(() => savedAuthKey.method).thenReturn('anonymous');
      when(() => authKey.getById(5)).thenAnswer((_) async => savedAuthKey);

      // Set up "all keys" loading
      final otherKey = MockAuthKey();
      when(() => otherKey.method).thenReturn('email');
      when(() => authKey.getAllForUserId(10)).thenAnswer(
        (_) async => [savedAuthKey, otherKey],
      );

      final response = await AnonymousUserController.checkSession(
        appSession,
        keyIdentifier: '5:xyz',
      );

      expect(response, isA<AppAuthSuccess>());
      final success = response as AppAuthSuccess;
      expect(success.userInfoData, userInfoJson);
      expect(success.key, 'xyz');
      expect(success.keyId, 5);
      expect(success.method, AuthType.anonymous);
      expect(success.allMethods, [AuthType.anonymous, AuthType.email]);
    });
  });
}
