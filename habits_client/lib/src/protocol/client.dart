/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:app_shared/src/messages/auth/app_auth_response.dart' as _i3;
import 'package:habits_shared/src/models/user.dart' as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
import 'protocol.dart' as _i6;

/// Callable endpoints for accounts with "anonymous" sessions.
/// {@category Endpoint}
class EndpointAppAuth extends _i1.EndpointRef {
  EndpointAppAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'appAuth';

  /// Creates an initial anonymous account which a user may or may not later
  /// upgrade.
  _i2.Future<_i3.AppAuthResponse> createAnonymous(
          {required String userIdentifier}) =>
      caller.callServerEndpoint<_i3.AppAuthResponse>(
        'appAuth',
        'createAnonymous',
        {'userIdentifier': userIdentifier},
      );

  /// Verifies the [keyIdentifier] for an "anonymous" sesion.
  _i2.Future<_i3.AppAuthResponse> checkSession(
          {required String keyIdentifier}) =>
      caller.callServerEndpoint<_i3.AppAuthResponse>(
        'appAuth',
        'checkSession',
        {'keyIdentifier': keyIdentifier},
      );
}

/// Callable endpoints for the [User] model.
/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  /// {@macro UserController.getForSession}
  _i2.Future<_i4.User> getForSession() => caller.callServerEndpoint<_i4.User>(
        'user',
        'getForSession',
        {},
      );

  /// Saves all fields on [user], but returns an error if the given user is
  /// not associated with the active session.
  _i2.Future<_i4.User> update(_i4.User user) =>
      caller.callServerEndpoint<_i4.User>(
        'user',
        'update',
        {'user': user},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    appAuth = EndpointAppAuth(this);
    user = EndpointUser(this);
    modules = _Modules(this);
  }

  late final EndpointAppAuth appAuth;

  late final EndpointUser user;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'appAuth': appAuth,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
