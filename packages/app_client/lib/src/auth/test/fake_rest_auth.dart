import 'dart:collection';
import 'package:app_client/app_client.dart';

/// Scriptable auth results from the application server.
class FakeRestAuth<T> implements BaseRestAuth<T> {
  /// Scriptable auth results from the application server.
  FakeRestAuth({
    Queue<UserOrError<T>>? loginResults,
    Queue<UserOrError<T>>? registerResults,
  })  : loginResults = loginResults ?? Queue<UserOrError<T>>(),
        registerResults = registerResults ?? Queue<UserOrError<T>>();

  /// Fake-only queue for scriptable login results.
  final Queue<UserOrError<T>> loginResults;

  /// Fake-only queue for scriptable registration results.
  final Queue<UserOrError<T>> registerResults;

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
  Future<UserOrError<T>> createAnonymous({
    required String firebaseUid,
    required String username,
  }) {
    // TODO: implement createAnonymous
    throw UnimplementedError();
  }
}
