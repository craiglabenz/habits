import 'package:habits_server/src/app_session/app_session.dart';
import 'package:habits_server/src/queries/queries.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<AppSession>(),
  MockSpec<UserQueries>(),
  MockSpec<UserInfoQueries>(),
  MockSpec<AuthKeyQueries>()
])
export 'app_session_mock.mocks.dart';
