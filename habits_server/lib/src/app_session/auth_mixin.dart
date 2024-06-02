part of 'app_session.dart';

/// Applied to AppSession.
mixin AuthSessionMixin {
  void _initAuth() {
    _authKey = AuthKeyQueries();
    _user = UserQueries();
    _userInfo = UserInfoQueries();
  }

  void _setAuthSession(Session session) {
    authKey.setSession(session);
    user.setSession(session);
    userInfo.setSession(session);
  }

  AuthKeyQueries? _authKey;
  AuthKeyQueries get authKey {
    if (_authKey == null) {
      throw Exception(
        'AppSession.authKey not initialized. Did you call '
        '`AppSession.instance.init()`?',
      );
    }
    return _authKey!;
  }

  UserInfoQueries? _userInfo;
  UserInfoQueries get userInfo {
    if (_userInfo == null) {
      throw Exception(
        'AppSession.userInfo not initialized. Did you call '
        '`AppSession.instance.init()`?',
      );
    }
    return _userInfo!;
  }

  UserQueries? _user;
  UserQueries get user {
    if (_user == null) {
      throw Exception(
        'AppSession.user not initialized. Did you call '
        '`AppSession.instance.init()`?',
      );
    }
    return _user!;
  }
}
