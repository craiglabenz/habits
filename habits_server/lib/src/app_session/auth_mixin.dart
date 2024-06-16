part of 'app_session.dart';

/// Applied to AppSession.
mixin AuthSessionMixin {
  void _initAuth(Session session) {
    _authKey = AuthKeyQueries(session);
    _emailAuth = EmailAuthQueries(session);
    _user = UserQueries(session);
    _userInfo = UserInfoQueries(session);
  }

  AuthKeyQueries? _authKey;

  /// {@macro AuthKeyQueries}
  AuthKeyQueries get authKey {
    if (_authKey == null) {
      throw Exception(
        'AppSession.authKey not initialized. Did you call '
        '`AppSession._initAuth()`?',
      );
    }
    return _authKey!;
  }

  EmailAuthQueries? _emailAuth;

  /// {@macro EmailAuthQueries}
  EmailAuthQueries get emailAuth {
    if (_emailAuth == null) {
      throw Exception(
        'AppSession.emailAuth not initialized. Did you call '
        '`AppSession._initAuth()`?',
      );
    }
    return _emailAuth!;
  }

  UserInfoQueries? _userInfo;

  /// {@macro UserInfoQueries}
  UserInfoQueries get userInfo {
    if (_userInfo == null) {
      throw Exception(
        'AppSession.userInfo not initialized. Did you call '
        '`AppSession._initAuth()`?',
      );
    }
    return _userInfo!;
  }

  UserQueries? _user;

  /// {@macro UserQueries}
  UserQueries get user {
    if (_user == null) {
      throw Exception(
        'AppSession.user not initialized. Did you call '
        '`AppSession._initAuth()`?',
      );
    }
    return _user!;
  }
}
