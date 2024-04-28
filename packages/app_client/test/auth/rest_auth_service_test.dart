import 'dart:convert';
import 'package:app_client/app_client.dart';
import 'package:app_client/src/auth/test/test.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

Future<http.Response> login200Handler(
  Uri url, {
  Map<String, String>? headers,
}) async {
  if (url.path != '/api/v1/login') {
    return http.Response('Not Found', 404, headers: normalHeaders);
  }
  if (!url.queryParameters.containsKey('email')) {
    return http.Response('Bad Request', 400, headers: normalHeaders);
  }
  if (!url.queryParameters.containsKey('password')) {
    return http.Response('Bad Request', 400, headers: normalHeaders);
  }
  return http.Response(
    '{"id": "abc", "apiKey": "123xyz"}',
    200,
    headers: normalHeaders,
  );
}

Future<http.Response> login400Handler(
  Uri url, {
  Map<String, String>? headers,
}) async {
  return http.Response('Bad Request', 400, headers: normalHeaders);
}

Future<http.Response> register200Handler(
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
}) async {
  assert(body != null, 'Must pass a non-null `body`');
  assert(body is String, 'Must pass a String value for `body`');
  if (url.path != '/api/v1/register') {
    return http.Response('Not Found', 404, headers: normalHeaders);
  }
  final requestBody = json.decode(body! as String) as Json;
  if (!requestBody.containsKey('email')) {
    return http.Response('Bad Request', 400, headers: normalHeaders);
  }
  if (!requestBody.containsKey('password')) {
    return http.Response('Bad Request', 400, headers: normalHeaders);
  }
  return http.Response(
    '{"id": "abc", "apiKey": "123xyz"}',
    200,
    headers: normalHeaders,
  );
}

Future<http.Response> register409Handler(
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
}) async {
  return http.Response('Conflict', 409, headers: normalHeaders);
}

RestAuth<AuthUser, String> setUpAuthService({
  ReadHandler? readHandler,
  WriteRequestHandler? postHandler,
  WriteRequestHandler? putHandler,
  WriteRequestHandler? patchHandler,
  WriteRequestHandler? deleteHandler,
  ResponseProcessor? responseProcessor,
}) {
  final api = RestApi(
    apiBaseUrl: 'https://fake.com',
    delegate: RequestDelegate.fake(
      readHandler: readHandler,
      postHandler: postHandler,
      putHandler: putHandler,
      patchHandler: patchHandler,
      deleteHandler: deleteHandler,
      responseProcessor: responseProcessor,
    ),
    headersBuilder: () => <String, String>{},
  );
  return RestAuth<AuthUser, String>(
    api: api,
    requestBuilder: const FakeUserRequestBuilder(),
    bindings: FakeAuthUserBindings(),
  );
}

void main() {
  group('RestAuth.login should', () {
    test('return a logged in user', () async {
      final auth = setUpAuthService(readHandler: login200Handler);
      final result = await auth.login(
        email: 'fake@email.com',
        password: 'password',
      );
      expect(result, isRight);
      final user = result.getOrRaise();
      expect(user.id, 'abc');
      expect(user.apiKey, '123xyz');
    });

    test('handle a bad response', () async {
      final auth = setUpAuthService(readHandler: login400Handler);
      final result = await auth.login(
        email: 'does not matter',
        password: 'does not matter',
      );
      expect(result, isLeft);
      expect(result.leftOrRaise(), isA<BadEmailPasswordError>());
    });
  });

  group('RestAuth.register should', () {
    test('return a registered user', () async {
      final auth = setUpAuthService(postHandler: register200Handler);
      final result = await auth.register(
        email: 'fake@email.com',
        password: 'password',
      );
      expect(result, isRight);
      final user = result.getOrRaise();
      expect(user.id, 'abc');
      expect(user.apiKey, '123xyz');
    });
    test('handle a bad response', () async {
      final auth = setUpAuthService(postHandler: register409Handler);
      final result = await auth.register(
        email: 'does not matter',
        password: 'does not matter',
      );
      expect(result, isLeft);
      expect(result.leftOrRaise(), isA<EmailTakenError>());
    });
  });
}

const normalHeaders = <String, String>{
  'Content-Type': 'application/json',
};
