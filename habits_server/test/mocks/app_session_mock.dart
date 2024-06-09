// ignore_for_file: require_trailing_commas
import 'package:habits_server/src/app_session/app_session.dart';
import 'package:habits_server/src/queries/queries.dart';
import 'package:habits_server/src/utilities/utilities.dart';
import 'package:mockito/annotations.dart';
import 'package:serverpod/serverpod.dart';

@GenerateNiceMocks([
  MockSpec<AppSession>(),
  MockSpec<UserQueries>(),
  MockSpec<UserInfoQueries>(),
  MockSpec<AuthKeyQueries>(),
  MockSpec<KeyValidator>(),
  MockSpec<AuthenticationInfo>(),
])
export 'app_session_mock.mocks.dart';
