import 'package:habits_server/src/queries/queries.dart';
import 'package:serverpod/serverpod.dart';
// ignore: implementation_imports
import 'package:serverpod_auth_server/src/business/authentication_util.dart'
    as util;

part 'auth_mixin.dart';

class AppSession with AuthSessionMixin {
  AppSession(Session session) {
    _session = session;
    _initAuth(session);
  }
  late Session _session;

  Map<String, String> get passwords => _session.passwords;

  String get authKeySalt => passwords['authKeySalt'] ?? util.defaultAuthKeySalt;

  hashString(String value) => util.hashString(authKeySalt, value);

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

  Future<Session> createSession({
    bool enableLogging = true,
  }) =>
      _session.serverpod.createSession(enableLogging: enableLogging);
}
