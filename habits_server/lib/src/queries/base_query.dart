import 'package:serverpod/serverpod.dart';

class BaseQuery {
  Session? _session;
  Session get session {
    if (_session == null) {
      throw Exception('Failed to set `session`');
    }
    return _session!;
  }

  void setSession(Session session) {
    _session = session;
    session.addOnClose(clearSession);
  }

  void clearSession() => _session = null;
}
