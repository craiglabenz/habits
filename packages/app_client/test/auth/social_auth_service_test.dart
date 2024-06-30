// ignore_for_file: deprecated_member_use
import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class MockFirebaseAuth extends Mock implements firebase_auth.FirebaseAuth {}

class MockFirebaseUser extends Mock implements firebase_auth.User {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {
  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => 0;
}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockAuthorizationCredentialAppleID extends Mock
    implements AuthorizationCredentialAppleID {}

class MockUserCredential extends Mock implements firebase_auth.UserCredential {}

class FakeAuthCredential extends Fake implements firebase_auth.AuthCredential {}

void main() {
  late firebase_auth.FirebaseAuth firebaseAuth;
  late BaseSocialAuth socialAuth;
  late GoogleSignIn googleSignIn;
  late GetAppleCredentials getAppleCredentials;
  late List<List<AppleIDAuthorizationScopes>> getAppleCredentialsCalls;
  late AuthorizationCredentialAppleID authorizationCredentialAppleID;
  TestWidgetsFlutterBinding.ensureInitialized();
  late firebase_auth.User firebaseUser;

  const email = 'test@gmail.com';
  const password = 't0ps3cret42';
  setUpAll(() {
    registerFallbackValue(FakeAuthCredential());
  });

  group('SocialAuthService.signUp should', () {
    setUp(() {
      firebaseAuth = MockFirebaseAuth();
      when(
        () => firebaseAuth.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) => Future.value(MockUserCredential()));
      when(
        () => firebaseAuth.fetchSignInMethodsForEmail(any()),
      ).thenAnswer((_) => Future.value(<String>[]));

      googleSignIn = MockGoogleSignIn();
      authorizationCredentialAppleID = MockAuthorizationCredentialAppleID();
      getAppleCredentialsCalls = <List<AppleIDAuthorizationScopes>>[];
      getAppleCredentials = ({
        List<AppleIDAuthorizationScopes> scopes = const [],
        WebAuthenticationOptions? webAuthenticationOptions,
        String? nonce,
        String? state,
      }) async {
        getAppleCredentialsCalls.add(scopes);
        return authorizationCredentialAppleID;
      };

      socialAuth = FirebaseAuthService(
        firebaseAuth: firebaseAuth,
        getAppleCredentials: getAppleCredentials,
        googleSignIn: googleSignIn,
      );
    });

    test('call createUserWithEmailAndPassword correctly', () async {
      await socialAuth.signUp(email: email, password: password);
      verify(
        () => firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).called(1);
    });

    test(
      'return AuthenticationError when createUserWithEmailAndPassword throws',
      () async {
        when(
          () => firebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Exception());
        expect(
          await socialAuth.signUp(
            email: email,
            password: password,
          ),
          isLeft,
        );
      },
    );
  });

  group('SocialAuthService.logInWithEmailAndPassword', () {
    setUp(() {
      when(
        () => firebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) => Future.value(MockUserCredential()));
      // Wrap the email methods
      when(
        () => firebaseAuth.fetchSignInMethodsForEmail(any()),
      ).thenAnswer((_) => Future.value(<String>[]));

      socialAuth = FirebaseAuthService(
        firebaseAuth: firebaseAuth,
        getAppleCredentials: getAppleCredentials,
        googleSignIn: googleSignIn,
      );
    });

    test('calls signInWithEmailAndPassword', () async {
      await socialAuth.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      verify(
        () => firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).called(1);
    });

    test(
      'returns an AuthenticationError when signInWithEmailAndPassword throws',
      () async {
        when(
          () => firebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Exception());
        expect(
          await socialAuth.logInWithEmailAndPassword(
            email: email,
            password: password,
          ),
          isLeft,
        );
      },
    );
  });

  group('SocialAuthService.loginWithGoogle should', () {
    const accessToken = 'access-token';
    const idToken = 'id-token';

    setUp(() {
      firebaseAuth = MockFirebaseAuth();
      googleSignIn = MockGoogleSignIn();
      authorizationCredentialAppleID = MockAuthorizationCredentialAppleID();
      getAppleCredentialsCalls = <List<AppleIDAuthorizationScopes>>[];
      getAppleCredentials = ({
        List<AppleIDAuthorizationScopes> scopes = const [],
        WebAuthenticationOptions? webAuthenticationOptions,
        String? nonce,
        String? state,
      }) async {
        getAppleCredentialsCalls.add(scopes);
        return authorizationCredentialAppleID;
      };
      final googleSignInAuthentication = MockGoogleSignInAuthentication();
      final googleSignInAccount = MockGoogleSignInAccount();
      when(() => googleSignInAuthentication.accessToken)
          .thenReturn(accessToken);
      when(() => googleSignInAuthentication.idToken).thenReturn(idToken);
      when(() => googleSignInAccount.authentication)
          .thenAnswer((_) async => googleSignInAuthentication);
      when(() => googleSignIn.signIn())
          .thenAnswer((_) async => googleSignInAccount);
      when(() => firebaseAuth.signInWithCredential(any()))
          .thenAnswer((_) => Future.value(MockUserCredential()));
      when(
        () => firebaseAuth.fetchSignInMethodsForEmail(any()),
      ).thenAnswer((_) => Future.value(<String>[]));

      socialAuth = FirebaseAuthService(
        firebaseAuth: firebaseAuth,
        getAppleCredentials: getAppleCredentials,
        googleSignIn: googleSignIn,
      );
    });

    test('calls signIn authentication, and signInWithCredential', () async {
      await socialAuth.logInWithGoogle();
      verify(() => googleSignIn.signIn()).called(1);
      verify(() => firebaseAuth.signInWithCredential(any())).called(1);
    });

    test('returns an AuthenticationError when exception occurs', () async {
      when(() => firebaseAuth.signInWithCredential(any()))
          .thenThrow(Exception());
      expect(
        await socialAuth.logInWithGoogle(),
        isLeft,
      );
    });
  });

  group('SocialAuthService.logInWithApple should', () {
    setUp(() async {
      firebaseAuth = MockFirebaseAuth();
      googleSignIn = MockGoogleSignIn();
      authorizationCredentialAppleID = MockAuthorizationCredentialAppleID();
      getAppleCredentialsCalls = <List<AppleIDAuthorizationScopes>>[];
      getAppleCredentials = ({
        List<AppleIDAuthorizationScopes> scopes = const [],
        WebAuthenticationOptions? webAuthenticationOptions,
        String? nonce,
        String? state,
      }) async {
        getAppleCredentialsCalls.add(scopes);
        return authorizationCredentialAppleID;
      };
      when(() => firebaseAuth.signInWithCredential(any()))
          .thenAnswer((_) => Future.value(MockUserCredential()));
      when(() => authorizationCredentialAppleID.identityToken).thenReturn('');
      when(() => authorizationCredentialAppleID.authorizationCode)
          .thenReturn('');
      when(
        () => firebaseAuth.fetchSignInMethodsForEmail(any()),
      ).thenAnswer((_) => Future.value(<String>[]));

      socialAuth = FirebaseAuthService(
        firebaseAuth: firebaseAuth,
        getAppleCredentials: getAppleCredentials,
        googleSignIn: googleSignIn,
      );
    });

    test('calls getAppleCredentials with correct scopes', () async {
      await socialAuth.logInWithApple();
      expect(getAppleCredentialsCalls, [
        [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ]
      ]);
    });

    test('calls signInWithCredential with correct credential', () async {
      const identityToken = 'identity-token';
      const accessToken = 'access-token';
      when(() => authorizationCredentialAppleID.identityToken)
          .thenReturn(identityToken);
      when(() => authorizationCredentialAppleID.authorizationCode)
          .thenReturn(accessToken);
      await socialAuth.logInWithApple();
      verify(() => firebaseAuth.signInWithCredential(any())).called(1);
    });

    test('throws LogInWithAppleFailure when exception occurs', () async {
      when(() => firebaseAuth.signInWithCredential(any()))
          .thenThrow(Exception());
      expect(await socialAuth.logInWithApple(), isLeft);
    });
  });

  group('SocialAuthService.logOut', () {
    test('calls signOut', () async {
      when(() => firebaseAuth.signOut()).thenAnswer((_) async {});
      when(() => googleSignIn.signOut())
          .thenAnswer((_) async => Future.value());

      socialAuth = FirebaseAuthService(
        firebaseAuth: firebaseAuth,
        getAppleCredentials: getAppleCredentials,
        googleSignIn: googleSignIn,
      );
      await socialAuth.logOut();
      verify(() => firebaseAuth.signOut()).called(1);
      verify(() => googleSignIn.signOut()).called(1);
    });

    test('throws LogOutFailure when signOut throws', () async {
      socialAuth = FirebaseAuthService(
        firebaseAuth: firebaseAuth,
        getAppleCredentials: getAppleCredentials,
        googleSignIn: googleSignIn,
      );
      await socialAuth.logOut();
      when(() => firebaseAuth.signOut()).thenThrow(Exception());
      expect(
        await socialAuth.logOut(),
        isLeft,
      );
    });
  });

  group('SocialAuthService.addEmailAuth should', () {
    test('create and link a credential', () async {
      firebaseAuth = MockFirebaseAuth();
      firebaseUser = MockFirebaseUser();
      final userCredential = MockUserCredential();

      when(() => firebaseAuth.currentUser).thenReturn(firebaseUser);
      when(() => firebaseUser.linkWithCredential(any()))
          .thenAnswer((_) async => Future.value(userCredential));
      when(() => userCredential.user).thenReturn(firebaseUser);
      socialAuth = FirebaseAuthService(firebaseAuth: firebaseAuth);
      final userOrError = await socialAuth.addEmailAuth(
        email: 'some@email.com',
        password: '12345678',
      );
      expect(userOrError, isRight);
    });

    test('return an error when there is no user', () async {
      firebaseAuth = MockFirebaseAuth();
      firebaseUser = MockFirebaseUser();
      final userCredential = MockUserCredential();
      when(() => firebaseAuth.currentUser).thenReturn(firebaseUser);
      when(() => firebaseUser.linkWithCredential(any()))
          .thenAnswer((_) async => userCredential);
      when(() => userCredential.user).thenReturn(null);
      socialAuth = FirebaseAuthService(firebaseAuth: firebaseAuth);
      final userOrError = await socialAuth.addEmailAuth(
        email: 'some@email.com',
        password: '12345678',
      );
      expect(userOrError, isLeft);
    });

    test('catch firebase exceptions', () async {
      firebaseAuth = MockFirebaseAuth();
      firebaseUser = MockFirebaseUser();
      when(() => firebaseAuth.currentUser).thenReturn(firebaseUser);
      when(() => firebaseUser.linkWithCredential(any())).thenThrow(
        firebase_auth.FirebaseAuthException(
          message: 'xyz',
          code: 'account-exists-with-different-credential',
        ),
      );
      socialAuth = FirebaseAuthService(firebaseAuth: firebaseAuth);
      final userOrError = await socialAuth.addEmailAuth(
        email: 'some@email.com',
        password: '12345678',
      );
      expect(userOrError, isLeft);
      expect(
        userOrError.leftOrRaise(),
        const AccountExistsError(fieldName: 'email', value: ''),
      );
    });
  });
}
