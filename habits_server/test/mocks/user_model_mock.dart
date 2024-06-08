import 'package:habits_shared/habits_shared.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<AuthKey>(),
  MockSpec<UserInfo>(),
  MockSpec<User>(),
])
export 'user_model_mock.mocks.dart';
