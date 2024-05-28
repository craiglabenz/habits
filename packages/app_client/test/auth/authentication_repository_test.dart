import 'dart:collection';
import 'package:app_client/app_client.dart';
import 'package:app_client/src/auth/test/test.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FakeRestAuth<AuthUser> restAuth;
  late AuthRepository authRepo;
  const user = AuthUser(
    id: FakeFirebaseUser.defaultUid,
    apiKey: 'apiKey',
    email: 'user@email.com',
  );
  const unexpectedUser = AuthUser(
    id: 'wrongId',
    apiKey: 'apiKey',
    email: 'user2@email.com',
  );
  const pw = 'pw';

  group('AuthRepository should', () {
    test(
      'successfully create an anonymous user',
      () async {
        restAuth = FakeRestAuth(
          createAnonymousUserResults:
              Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
        );
        final socialAuth = FakeStreamAuth();
        authRepo = AuthRepository(
          socialAuthService: socialAuth,
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          emitsInOrder([
            (AuthUser.unknown, false),
            (user, true),
          ]),
        );
        socialAuth
          ..emitUser(null)
          ..prepareLogin(buildFirebaseUser());
        final result = await authRepo.signInAnonymously('');
        expect(result, isRight);
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    test(
      'successfully restore a user session',
      () async {
        restAuth = FakeRestAuth(
          checkSessionResults:
              Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
        );
        final socialAuth = FakeStreamAuth();
        authRepo = AuthRepository(
          socialAuthService: socialAuth,
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          emitsInOrder(
            [(user, false)],
          ),
        );
        socialAuth.emitUser(buildFirebaseUser());
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    test(
      'successfully abort a mismatched user session during checkSession',
      () async {
        restAuth = FakeRestAuth(
          checkSessionResults:
              Queue.from(<UserOrError<AuthUser>>[const Right(unexpectedUser)]),
        );
        final socialAuth = FakeStreamAuth();
        authRepo = AuthRepository(
          socialAuthService: socialAuth,
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          emitsInOrder(
            [(AuthUser.unknown, false)],
          ),
        );
        socialAuth.emitUser(buildFirebaseUser());
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    test(
      'successfully create a user on sign up',
      () async {
        restAuth = FakeRestAuth(
          // Non-empty queue to confirm `login` was never called
          loginResults: Queue.from(<UserOrError<AuthUser>>[
            const Left(AuthenticationError.badEmailPassword()),
          ]),
          registerResults:
              Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
        );
        final socialAuth = FakeStreamAuth();
        authRepo = AuthRepository(
          socialAuthService: socialAuth,
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          emitsInOrder(
            [
              (AuthUser.unknown, false),
              (user, true),
            ],
          ),
        );

        socialAuth
          ..emitUser(null)
          ..prepareLogin(buildFirebaseUser());

        final result = await authRepo.signUp(
          email: user.email!,
          password: pw,
        );
        expect(result, isRight);
        final signedUpUser = result.getOrRaise();
        expect(signedUpUser.email, user.email);
        expect(signedUpUser.id, user.id);
        // Did not attempt to login because account is new
        expect(restAuth.loginResults, isNotEmpty);
        expect(restAuth.registerResults, isEmpty);
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    test(
      'fail to login a bad password and do not register',
      () async {
        restAuth = FakeRestAuth(
          loginResults: Queue.from(
            <UserOrError<AuthUser>>[
              const Left(AuthenticationError.badEmailPassword()),
            ],
          ),
          registerResults:
              Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
        );
        final socialAuth = FakeStreamAuth();
        authRepo = AuthRepository(
          socialAuthService: socialAuth,
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          emitsInOrder(
            [
              (AuthUser.unknown, false),
            ],
          ),
        );
        socialAuth
          ..emitUser(null)
          ..prepareLogin(buildFirebaseUser());
        final result = await authRepo.logInWithEmailAndPassword(
          email: user.email!,
          password: pw,
        );
        expect(result, isLeft);
        expect(restAuth.loginResults, isEmpty);
        expect(restAuth.registerResults, isNotEmpty);
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    test(
      'fail to register from RestAuth and cancel everything',
      () async {
        restAuth = FakeRestAuth(
          // Non-empty LOGIN queue only to verify it was never pulled from
          loginResults: Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
          registerResults: Queue.from(
            <UserOrError<AuthUser>>[
              const Left(AuthenticationError.badEmailPassword()),
            ],
          ),
        );
        final socialAuth = FakeStreamAuth();
        authRepo = AuthRepository(
          socialAuthService: socialAuth,
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          emitsInOrder(
            [
              (AuthUser.unknown, false),
            ],
          ),
        );
        socialAuth
          ..emitUser(null)
          ..prepareLogin(buildFirebaseUser());
        final result = await authRepo.signUp(
          email: user.email!,
          password: pw,
        );
        expect(result, isLeft);
        expect(restAuth.loginResults, isNotEmpty);
        expect(restAuth.registerResults, isEmpty);
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    test(
      'honor error from social and do nothing with rest',
      () async {
        restAuth = FakeRestAuth(
          // Non-empty queues only to verify they were never pulled from
          loginResults: Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
          registerResults:
              Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
        );
        final socialAuth = FakeStreamAuth();
        authRepo = AuthRepository(
          socialAuthService: socialAuth,
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          emitsInOrder(
            [
              (AuthUser.unknown, false),
            ],
          ),
        );
        socialAuth
          ..emitUser(null)
          ..error = const AuthenticationError.badEmailPassword();
        final result = await authRepo.signUp(
          email: user.email!,
          password: pw,
        );
        expect(result, isLeft);
        expect(restAuth.loginResults, isNotEmpty);
        expect(restAuth.registerResults, isNotEmpty);
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    test(
      'successfully logs in a user on Em/PW login',
      () async {
        restAuth = FakeRestAuth(
          loginResults: Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
        );
        final socialAuth = FakeStreamAuth();
        authRepo = AuthRepository(
          socialAuthService: socialAuth,
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          emitsInOrder(
            [
              (AuthUser.unknown, false),
              (user, false),
            ],
          ),
        );
        socialAuth
          ..emitUser(null)
          ..prepareLogin(buildFirebaseUser());
        final result = await authRepo.logInWithEmailAndPassword(
          email: user.email!,
          password: pw,
        );
        expect(result, isRight);
        expect(restAuth.loginResults.isEmpty, true);
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    test(
      'successfully creates a user that is new to the app server',
      () async {
        restAuth = FakeRestAuth(
          loginResults: Queue.from(
            <UserOrError<AuthUser>>[
              const Left(AuthenticationError.badEmailPassword()),
            ],
          ),
          registerResults:
              Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
        );
        final socialAuth = FakeStreamAuth();
        authRepo = AuthRepository(
          socialAuthService: socialAuth,
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          emitsInOrder(
            [
              (AuthUser.unknown, false),
              (user, true),
            ],
          ),
        );
        socialAuth
          ..emitUser(null)
          ..prepareLogin(buildFirebaseUser());
        final result = await authRepo.signUp(
          email: user.email!,
          password: pw,
        );
        expect(result, isRight);
        expect(restAuth.loginResults.isEmpty, false);
        expect(restAuth.registerResults.isEmpty, true);
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    test(
      'successfully suggests acceptable login forms',
      () async {
        restAuth = FakeRestAuth();
        final socialAuth = FakeStreamAuth()
          ..error = const AuthenticationError.wrongMethod(
            <AuthType>{AuthType.google},
          );
        authRepo = AuthRepository(
          socialAuthService: socialAuth,
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          emitsInOrder(
            [(AuthUser.unknown, false)],
          ),
          // neverEmits(anything),
        );
        socialAuth.emitUser(null);
        final result = await authRepo.logInWithEmailAndPassword(
          email: user.email!,
          password: pw,
        );
        expect(result, isLeft);
        final error = result.leftOrRaise();
        expect(error, const WrongMethod(<AuthType>{AuthType.google}));
        await authRepo.dispose();
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    test(
      'successfully suggests acceptable login forms on sign up',
      () async {
        restAuth = FakeRestAuth();
        final socialAuth = FakeStreamAuth()
          ..error = const AuthenticationError.wrongMethod(
            <AuthType>{AuthType.google},
          );
        authRepo = AuthRepository(
          socialAuthService: socialAuth,
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          emitsInOrder(
            [(AuthUser.unknown, false)],
          ),
          // neverEmits(anything),
        );
        socialAuth.emitUser(null);
        final result = await authRepo.signUp(
          email: user.email!,
          password: pw,
        );
        expect(result, isLeft);
        final error = result.leftOrRaise();
        expect(error, const WrongMethod(<AuthType>{AuthType.google}));
        await authRepo.dispose();
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );
  });
}
