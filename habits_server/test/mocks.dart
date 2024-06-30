import 'package:habits_server/src/app_session/app_session.dart';
import 'package:habits_server/src/generated/protocol.dart' as protocol;
import 'package:habits_server/src/queries/queries.dart';
import 'package:habits_server/src/utilities/utilities.dart';
import 'package:mocktail/mocktail.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

// MOCKS
class MockAppSession extends Mock implements AppSession {}

class MockAuthKeyQueries extends Mock implements AuthKeyQueries {}

class MockUserInfoQueries extends Mock implements UserInfoQueries {}

class MockEmailAuthQueries extends Mock implements EmailAuthQueries {}

class MockUserQueries extends Mock implements UserQueries {}

class MockProtocolUser extends Mock implements protocol.User {}

class MockEmailAuth extends Mock implements EmailAuth {}

class MockAuthKey extends Mock implements AuthKey {}

class MockUserInfo extends Mock implements UserInfo {}

class MockAuthenticationInfo extends Mock implements AuthenticationInfo {}

class MockKeyValidator extends Mock implements KeyValidator {}

// FAKES
class FakeUserInfo extends Fake implements UserInfo {}

class FakeAuthKey extends Fake implements AuthKey {}

class FakeProtocolUser extends Fake implements protocol.User {}
