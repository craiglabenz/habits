// ignore_for_file: require_trailing_commas
import 'package:habits_shared/habits_shared.dart';
import 'package:mockito/annotations.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

@GenerateNiceMocks([
  MockSpec<AuthKey>(),
  MockSpec<EmailAuth>(),
  MockSpec<UserInfo>(),
  MockSpec<User>(),
])
export 'user_model_mock.mocks.dart';
