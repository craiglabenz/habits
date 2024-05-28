import 'dart:async';
import 'package:app_client/app_client.dart';
import 'package:app_client/src/auth/test/test.dart';
import 'package:dartz/dartz.dart';

/// Pass-thru implementation of [BaseSocialAuth] with scriptable results.
class FakeStreamAuth extends BaseSocialAuth {
  /// The user to be added to the stream during the next login attempt
  /// IFF [error] is null.
  FirebaseUser? _user;

  /// If not null, the exception to be thrown during the next login attempt.
  /// This value is reset to `null` after each being thrown.
  AuthenticationError? error;
  final StreamController<FirebaseUser?> _controller =
      StreamController<FirebaseUser?>();

  /// Sets the user to be yielded by the next login/sign up attempt.
  // ignore: use_setters_to_change_properties
  void prepareLogin(FirebaseUser? user) => _user = user;

  /// Sets the error to be thrown by the next login/sign up attempt.
  // ignore: use_setters_to_change_properties
  void prepareLoginError(AuthenticationError e) => error = e;

  @override
  Future<Set<AuthType>> getAvailableMethods(String email) =>
      Future.value(<AuthType>{});

  @override
  Future<FirebaseUserOrError> logInWithApple() async => _publishUser();

  @override
  Future<FirebaseUserOrError> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      _publishUser();

  @override
  Future<FirebaseUserOrError> logInWithGoogle() async => _publishUser();

  @override
  Future<Either<AuthenticationError, LogoutSentinel>> logOut() async {
    if (_user != null) {
      _user = null;
      _controller.sink.add(_user);
    }
    return const Right(LogoutSentinel());
  }

  @override
  Future<FirebaseUserOrError> signUp({
    required String email,
    required String password,
  }) async =>
      _publishUser();

  FirebaseUserOrError _publishUser() {
    if (error != null) {
      final errorCopy = error!;
      error = null;
      return Left(errorCopy);
    }
    emitUser(_user);
    return Right(
      FakeFirebaseUser(
        uid: _user!.uid,
        displayName: _user!.email,
        email: _user?.email,
        isAnonymous: _user == null,
      ),
    );
  }

  /// Force the given user through the pipeline.
  void emitUser(FirebaseUser? user) {
    _user = user;
    _controller.sink.add(user);
  }

  @override
  Stream<FirebaseUser?> get users => _controller.stream;

  @override
  Future<void> deleteUser(FirebaseUser user) async {}

  @override
  Future<FirebaseUserOrError> signInAnonymously() async {
    prepareLogin(
      const FakeFirebaseUser(isAnonymous: true),
    );
    return _publishUser();
  }
}
