/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/app_auth_endpoint.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'appAuth': _i2.AppAuthEndpoint()
        ..initialize(
          server,
          'appAuth',
          null,
        )
    };
    connectors['appAuth'] = _i1.EndpointConnector(
      name: 'appAuth',
      endpoint: endpoints['appAuth']!,
      methodConnectors: {
        'createAnonymous': _i1.MethodConnector(
          name: 'createAnonymous',
          params: {
            'userIdentifier': _i1.ParameterDescription(
              name: 'userIdentifier',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appAuth'] as _i2.AppAuthEndpoint).createAnonymous(
            session,
            userIdentifier: params['userIdentifier'],
            username: params['username'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i3.Endpoints()..initializeEndpoints(server);
  }
}
