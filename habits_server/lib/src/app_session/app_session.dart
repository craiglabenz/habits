import 'package:habits_server/src/queries/queries.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
// ignore: implementation_imports
import 'package:serverpod_auth_server/src/business/authentication_util.dart'
    as util;

part 'auth_mixin.dart';

/// {@template AppSession}
/// Wrapper around a Serverpod [Session].
/// {@endtemplate}
class AppSession with AuthSessionMixin {
  /// {@macro AppSession}
  AppSession(Session session) {
    _session = session;
    _initAuth(session);
  }
  late Session _session;

  /// Pass-thru to the inner session's passwords.
  Map<String, String> get passwords => _session.passwords;

  /// Pass-thru to the inner session's [AuthKey] salt.
  String get authKeySalt => passwords['authKeySalt'] ?? util.defaultAuthKeySalt;

  /// Hashing function for api keys.
  String hashString(String value) => util.hashString(authKeySalt, value);

  /// Logs messages to the database.
  void log(
    String message, {
    LogLevel? level,
    dynamic exception,
    StackTrace? stackTrace,
  }) =>
      _session.log(
        message,
        level: level,
        exception: exception,
        stackTrace: stackTrace,
      );

  /// Creates new database sessions, usually for the purposes of turning off
  /// logging when queries contain sensitive data.
  Future<Session> createSession({
    bool enableLogging = true,
  }) =>
      _session.serverpod.createSession(enableLogging: enableLogging);
}
