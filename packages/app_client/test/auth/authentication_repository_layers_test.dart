import 'dart:collection';
import 'package:app_client/app_client.dart';
import 'package:app_client/src/auth/test/test.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_test/flutter_test.dart';

FirebaseUser buildFbUser({required Duration accountAge}) {
  final now = DateTime.now().toUtc();
  return FakeFirebaseUser(
    uid: 'asdf',
    email: 'user@domain.com',
    metadata: firebase_auth.UserMetadata(
      now.subtract(accountAge).millisecondsSinceEpoch,
      now.millisecondsSinceEpoch,
    ),
  );
}

void main() {
  late FakeRestAuth<AuthUser> restAuth;
  late AuthRepository<AuthUser> authRepo;
  const user = AuthUser(
    id: 'asdf',
    apiKey: 'apiKey',
    email: 'user@email.com',
  );
  const pw = 'pw';

  group('AuthRepository should', () {
    test('successfully create a user on sign up', () async {
      final fbUser = buildFbUser(accountAge: Duration.zero);
      restAuth = FakeRestAuth(
        loginResults: Queue.from(
          <UserOrError<AuthUser>>[
            const Left(AuthenticationError.badEmailPassword()),
          ],
        ),
        registerResults: Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
      );
      authRepo = AuthRepository(
        streamAuthService: FakeStreamAuth()..prepareLogin(fbUser),
        restAuthService: restAuth,
      );
      final userStreamExpectation =
          expectLater(authRepo.user, emitsInOrder([user]));
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
    });

    test('fail to login a bad password and do not register', () async {
      final fbUser = buildFbUser(accountAge: const Duration(seconds: 10));
      restAuth = FakeRestAuth(
        loginResults: Queue.from(
          <UserOrError<AuthUser>>[
            const Left(AuthenticationError.badEmailPassword()),
          ],
        ),
        registerResults: Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
      );
      authRepo = AuthRepository(
        streamAuthService: FakeStreamAuth()..prepareLogin(fbUser),
        restAuthService: restAuth,
      );
      final userStreamExpectation = expectLater(
        authRepo.user,
        emitsInOrder([null]),
      );
      final result = await authRepo.signUp(
        email: user.email!,
        password: pw,
      );
      expect(result, isLeft);
      expect(restAuth.loginResults, isEmpty);
      expect(restAuth.registerResults, isNotEmpty);
      await userStreamExpectation;
    });

    test('successfully logs in a user on Em/PW login', () async {
      final fbUser = buildFbUser(accountAge: const Duration(seconds: 10));
      restAuth = FakeRestAuth(
        loginResults: Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
      );
      authRepo = AuthRepository(
        streamAuthService: FakeStreamAuth()..prepareLogin(fbUser),
        restAuthService: restAuth,
      );
      final userStreamExpectation = expectLater(
        authRepo.user,
        emitsInOrder([user]),
      );
      final result = await authRepo.logInWithEmailAndPassword(
        email: user.email!,
        password: pw,
      );
      expect(result, isRight);
      expect(restAuth.loginResults.isEmpty, true);
      await userStreamExpectation;
    });

    test('successfully creates a user that is new to the app server', () async {
      final newFbUser = buildFbUser(accountAge: Duration.zero);
      restAuth = FakeRestAuth(
        loginResults: Queue.from(
          <UserOrError<AuthUser>>[
            const Left(AuthenticationError.badEmailPassword()),
          ],
        ),
        registerResults: Queue.from(<UserOrError<AuthUser>>[const Right(user)]),
      );
      authRepo = AuthRepository(
        streamAuthService: FakeStreamAuth()..prepareLogin(newFbUser),
        restAuthService: restAuth,
      );
      final userStreamExpectation = expectLater(
        authRepo.user,
        emitsInOrder([user]),
      );
      final result = await authRepo.logInWithEmailAndPassword(
        email: user.email!,
        password: pw,
      );
      expect(result, isRight);
      expect(restAuth.loginResults.isEmpty, false);
      expect(restAuth.registerResults.isEmpty, true);
      await userStreamExpectation;
    });

    test(
      'successfully suggests acceptable login forms',
      () async {
        restAuth = FakeRestAuth();
        authRepo = AuthRepository(
          streamAuthService: FakeStreamAuth()
            ..error = const AuthenticationError.wrongMethod(
              <LoginType>{LoginType.google},
            ),
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          neverEmits(anything),
        );
        final result = await authRepo.logInWithEmailAndPassword(
          email: user.email!,
          password: pw,
        );
        expect(result, isLeft);
        final error = result.leftOrRaise();
        expect(error, const WrongMethod(<LoginType>{LoginType.google}));
        await authRepo.dispose();
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    test(
      'successfully suggests acceptable login forms on sign up',
      () async {
        restAuth = FakeRestAuth();
        authRepo = AuthRepository(
          streamAuthService: FakeStreamAuth()
            ..error = const AuthenticationError.wrongMethod(
              <LoginType>{LoginType.google},
            ),
          restAuthService: restAuth,
        );
        final userStreamExpectation = expectLater(
          authRepo.user,
          neverEmits(anything),
        );
        final result = await authRepo.signUp(
          email: user.email!,
          password: pw,
        );
        expect(result, isLeft);
        final error = result.leftOrRaise();
        expect(error, const WrongMethod(<LoginType>{LoginType.google}));
        await authRepo.dispose();
        await userStreamExpectation;
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );
  });
}
