import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habits_flutter/data/data.dart';
import 'package:habits_flutter/screens/account_auth/account_auth.dart';
import 'package:habits_shared/habits_shared.dart';
import 'package:mocktail/mocktail.dart';

class MockBaseAuthRepository<T> extends Mock implements BaseAuthRepository<T> {}

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
      'emits new emails',
      build: () => bloc,
      act: (bloc) => bloc.add(const EmailChangedEvent('abc@email.com')),
      expect: () => [
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          user: userRepo.loadedUser,
          newEmail: 'abc@email.com',
        ),
      ],
    );

    blocTest<AccountAuthBloc, AccountAuthState>(
      'rejects invalid emails',
      build: () => bloc,
      act: (bloc) => bloc.add(const EmailChangedEvent('abc')),
      expect: () => [
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          user: userRepo.loadedUser,
          newEmail: 'abc',
          newEmailValidationError: const InvalidValueError.invalidEmail(),
        ),
      ],
    );

    blocTest<AccountAuthBloc, AccountAuthState>(
      'emits new passwords',
      build: () => bloc,
      act: (bloc) => bloc.add(const PasswordChangedEvent('xyz123')),
      expect: () => [
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          user: userRepo.loadedUser,
          newPassword: 'xyz123',
        ),
      ],
    );

    blocTest<AccountAuthBloc, AccountAuthState>(
      'rejects invalid passwords',
      build: () => bloc,
      act: (bloc) => bloc.add(const PasswordChangedEvent('xyz')),
      expect: () => [
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          user: userRepo.loadedUser,
          newPassword: 'xyz',
          newPasswordValidationError:
              const PasswordTooShort(Password.minimumLength),
        ),
      ],
    );

    blocTest<AccountAuthBloc, AccountAuthState>(
      'adds email auth',
      setUp: () {
        authRepo = MockBaseAuthRepository<AuthUser>();
        when(() => authRepo.isReady).thenReturn(true);
        when(() => authRepo.lastUser).thenReturn(
          (emailUser, false),
        );
        when(
          () => authRepo.addEmailAuth(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => Right(emailUser.copyWith(email: 'new@email.com')),
        );
      },
      build: () {
        return AccountAuthBloc(authRepo, userRepo);
      },
      act: (bloc) => bloc
        ..add(const EmailChangedEvent('new@email.com'))
        ..add(const PasswordChangedEvent('password'))
        ..add(const AddEmailAuthEvent()),
      expect: () => [
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          user: userRepo.loadedUser,
          newEmail: 'new@email.com',
        ),
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          user: userRepo.loadedUser,
          newEmail: 'new@email.com',
          newPassword: 'password',
        ),
        AccountAuthState(
          authUser: authRepo.lastUser.$1.copyWith(email: 'new@email.com'),
          user: userRepo.loadedUser,
        ),
      ],
    );

    blocTest<AccountAuthBloc, AccountAuthState>(
      'reports errors saving email auth',
      setUp: () {
        authRepo = MockBaseAuthRepository<AuthUser>();
        when(() => authRepo.isReady).thenReturn(true);
        when(() => authRepo.lastUser).thenReturn(
          (emailUser, false),
        );
        when(
          () => authRepo.addEmailAuth(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => const Left(AuthenticationError.unknownError()),
        );
      },
      build: () {
        return AccountAuthBloc(authRepo, userRepo);
      },
      act: (bloc) => bloc
        ..add(const EmailChangedEvent('new@email.com'))
        ..add(const PasswordChangedEvent('password'))
        ..add(const AddEmailAuthEvent()),
      expect: () => [
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          user: userRepo.loadedUser,
          newEmail: 'new@email.com',
        ),
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          user: userRepo.loadedUser,
          newEmail: 'new@email.com',
          newPassword: 'password',
        ),
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          newEmail: 'new@email.com',
          newPassword: 'password',
          savingError: 'Error saving email auth',
          user: userRepo.loadedUser,
        ),
      ],
    );

    blocTest<AccountAuthBloc, AccountAuthState>(
      'saves new passwords',
      setUp: () {
        authRepo = MockBaseAuthRepository<AuthUser>();
        when(() => authRepo.isReady).thenReturn(true);
        when(() => authRepo.lastUser).thenReturn(
          (emailUser, false),
        );
        when(() => authRepo.updatePassword(any())).thenAnswer(
          (_) async => const Right(emailUser),
        );
      },
      build: () {
        return AccountAuthBloc(authRepo, userRepo);
      },
      act: (bloc) => bloc
        ..add(const PasswordChangedEvent('xyzabc'))
        ..add(const SaveNewPasswordEvent()),
      expect: () => [
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          user: userRepo.loadedUser,
          newPassword: 'xyzabc',
        ),
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          user: userRepo.loadedUser,
        ),
      ],
      verify: (bloc) {
        verify(() => authRepo.updatePassword('xyzabc')).called(1);
      },
    );

    blocTest<AccountAuthBloc, AccountAuthState>(
      'reports errors saving passwords',
      setUp: () {
        authRepo = MockBaseAuthRepository<AuthUser>();
        when(() => authRepo.isReady).thenReturn(true);
        when(() => authRepo.lastUser).thenReturn(
          (emailUser, false),
        );
        when(
          () => authRepo.updatePassword('password'),
        ).thenAnswer(
          (_) async => const Left(AuthenticationError.unknownError()),
        );
      },
      build: () {
        return AccountAuthBloc(authRepo, userRepo);
      },
      act: (bloc) => bloc
        ..add(const PasswordChangedEvent('password'))
        ..add(const SaveNewPasswordEvent()),
      expect: () => [
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          user: userRepo.loadedUser,
          newPassword: 'password',
        ),
        AccountAuthState(
          authUser: authRepo.lastUser.$1,
          newPassword: 'password',
          savingError: 'Error saving new password',
          user: userRepo.loadedUser,
        ),
      ],
    );
  });
}
