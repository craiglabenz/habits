import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habits_flutter/data/data.dart';
import 'package:habits_flutter/screens/account_auth/account_auth.dart';
import 'package:habits_shared/habits_shared.dart';

void main() {
  const anonymousUser = AuthUser(
    id: 'abc',
    apiKey: 'xyz',
    method: AuthType.anonymous,
    allMethods: [AuthType.anonymous],
  );
  const emailUser = AuthUser(
    id: 'emailUser',
    apiKey: 'emails',
    email: 'some@user.com',
    method: AuthType.email,
    allMethods: [AuthType.email],
  );
  const user = User(uid: 'asdf');
  late BaseAuthRepository<AuthUser> authRepo;
  late BaseSessionUserRepository userRepo;
  late AccountAuthBloc bloc;

  group('AccountAuthBloc with AuthType.anonymous users should', () {
    setUp(() {
      authRepo = FakeAuthRepository()..publishNewUser(anonymousUser, false);
      userRepo = FakeSessionUserRepository.ready(user);
      bloc = AccountAuthBloc(authRepo, userRepo);
    });
    blocTest<AccountAuthBloc, AccountAuthState>(
      'update new emqails',
      build: () => bloc,
      act: (bloc) => bloc.add(const EmailChangedEvent('abc')),
      verify: (bloc) {
        expect(
          bloc.state,
          AccountAuthState(
            authUser: authRepo.lastUser.$1,
            user: userRepo.loadedUser,
            newEmail: 'abc',
          ),
        );
      },
    );
  });
}
