import 'dart:collection';
import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';

/// Scriptable auth results from the application server.
class FakeRestAuth<T> implements BaseRestAuth<T> {
  /// Scriptable auth results from the application server.
  FakeRestAuth({
    Queue<UserOrError<T>>? loginResults,
    Queue<UserOrError<T>>? registerResults,
    Queue<UserOrError<T>>? checkSessionResults,
    Queue<UserOrError<T>>? createAnonymousUserResults,
  })  : loginResults = loginResults ?? Queue<UserOrError<T>>(),
        registerResults = registerResults ?? Queue<UserOrError<T>>(),
        createAnonymousUserResults =
            createAnonymousUserResults ?? Queue<UserOrError<T>>(),
        checkSessionResults = checkSessionResults ??
            Queue<UserOrError<T>>.from(
              [const Right<AuthenticationError, AuthUser>(AuthUser.unknown)],
            );

  /// Fake-only queue for scriptable login results.
  final Queue<UserOrError<T>> loginResults;

  /// Fake-only queue for scriptable registration results.
  final Queue<UserOrError<T>> registerResults;

  /// Fake-only queue for scriptable session check results.
  final Queue<UserOrError<T>> checkSessionResults;

  /// Fake-only queue for scriptable anonymous user sign-up results.
  final Queue<UserOrError<T>> createAnonymousUserResults;

  @override
  Future<UserOrError<T>> login({
    required String email,
    required String password,
  }) =>
      Future.value(loginResults.removeFirst());

  @override
  Future<UserOrError<T>> register({
    required String email,
    required String password,
  }) =>
      Future.value(registerResults.removeFirst());

  @override
  Future<UserOrError<T>> createAnonymous({required String firebaseUid}) =>
      Future.value(createAnonymousUserResults.removeFirst());

  @override
  Future<UserOrError<T>> checkSession() =>
      Future.value(checkSessionResults.removeFirst());

  @override
  Future<void> logOut() async {}

  @override
  Future<UserOrError<T>> addEmailAuth({
    required String email,
    required String password,
  }) {
    // TODO: implement addEmailAuth
    throw UnimplementedError();
  }

  @override
  Future<UserOrError<T>> updatePassword(String password) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}
