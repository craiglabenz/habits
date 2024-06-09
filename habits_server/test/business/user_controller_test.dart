import 'package:habits_server/src/business/business.dart';
import 'package:habits_server/src/generated/protocol.dart';
import 'package:habits_shared/habits_shared.dart' as shared;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import '../mocks/app_session_mock.mocks.dart';

void main() {
  late MockAppSession appSession;
  late MockUserQueries user;

  late User userRecord;
  late shared.User sharedUser;

  setUp(() {
    appSession = MockAppSession();
    user = MockUserQueries();

    final uuid = Uuid().v4();
    userRecord = User(
      userInfoId: 5,
      uid: UuidValue.fromString(uuid),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    sharedUser = shared.User(uid: uuid);
  });

  group('UserController.getForSession should', () {
    test('throw an exception when there is no session', () {
      when(appSession.authenticated).thenAnswer((_) async => null);
      expect(
        () => UserController.getForSession(appSession),
        throwsA(isA<Exception>()),
      );
    });

    test('throw NotFoundException when there is no User record', () {
      final authInfo = MockAuthenticationInfo();
      when(authInfo.userId).thenReturn(5);
      when(appSession.authenticated).thenAnswer((_) async => authInfo);

      when(user.getByUserInfoId(5)).thenAnswer((_) async => null);
      when(appSession.user).thenReturn(user);

      expect(
        () => UserController.getForSession(appSession),
        throwsA(isA<NotFoundException>()),
      );
    });

    test('return the record when one exists', () async {
      final authInfo = MockAuthenticationInfo();
      when(authInfo.userId).thenReturn(5);
      when(appSession.authenticated).thenAnswer((_) async => authInfo);

      when(user.getByUserInfoId(5)).thenAnswer(
        (_) async => userRecord,
      );
      when(appSession.user).thenReturn(user);

      expect(await UserController.getForSession(appSession), userRecord);
    });
  });

  group('UserController.update should', () {
    test('save the value', () async {
      final authInfo = MockAuthenticationInfo();
      when(authInfo.userId).thenReturn(5);
      when(appSession.authenticated).thenAnswer((_) async => authInfo);

      when(user.getByUserInfoId(5)).thenAnswer(
        (_) async => userRecord,
      );
      when(user.update(sharedUser)).thenAnswer(
        (_) async => userRecord,
      );
      when(appSession.user).thenReturn(user);

      expect(await UserController.update(appSession, sharedUser), userRecord);
      verify(user.update(sharedUser)).called(1);
    });
  });
}
