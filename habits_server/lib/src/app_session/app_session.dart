import 'package:serverpod/serverpod.dart';
import 'package:habits_server/src/queries/queries.dart';

part 'auth_mixin.dart';

class AppSession with AuthSessionMixin {
  AppSession._() {
    _initAuth();
  }
  factory AppSession() => instance;

  late Session _session;
  static AppSession instance = AppSession._();

  static AppSession setSession(Session session) {
    instance._session = session;
    instance._setAuthSession(session);
    return instance;
  }

  Map<String, String> get passwords => _session.passwords;

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
