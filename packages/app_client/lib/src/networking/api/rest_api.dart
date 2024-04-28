import 'dart:convert';
import 'dart:io';
import 'package:app_client/app_client.dart';

/// {@template HeadersBuilder}
/// Function to return the necessary headers for a given request. The
/// "Content-Type" and authorization headers are handled automatically, so this
/// function should only build any *other* headers.
/// {@endtemplate}
typedef HeadersBuilder = Map<String, String> Function();

/// {@template restApi}
/// Handler for RESTful external communications. Applications will need a unique
/// [RestApi] instane for every different API with which they communicate.
/// {@endtemplate}
class RestApi {
  /// {@macro restApi}
  RestApi({
    required this.apiBaseUrl,
    required this.headersBuilder,
    RequestDelegate? delegate,
    // TODO(craiglabenz): Add tests for this
    this.forceEndingSlash = false,
  }) : _delegate = delegate ?? const RequestDelegate.live();

  final RequestDelegate _delegate;

  /// {@macro HeadersBuilder}
  final HeadersBuilder headersBuilder;

  /// Root of this API's url. Should include the scheme, optional subdomain,
  /// domain, and TLD.
  final String apiBaseUrl;

  /// Whether to force a trailing slash on the end of the final Uri.
  final bool forceEndingSlash;

  final bool _shouldPrint = false;

  void _print(String msg) {
    if (!_shouldPrint) return;
    // ignore: avoid_print
    print(msg);
  }

  /// Builds default headers for all network requests.
  Map<String, String> getDefaultHeaders({
    String? contentType,
    String? accept,
  }) {
    // final headers = <String, String>{
    //   'Content-Type': contentType,
    //   // 'Accept': contentType,
    //   'App-Name': 'Habits',
    //   'App-Version': _appDetails.appVersion,
    //   'App-Build': '${_appDetails.buildNumber}',

    //   /// iOS/Android
    //   'App-OS': _appDetails.os.toString(),

    //   /// OS build number
    //   'App-OS-Version': _appDetails.osVersion,

    //   /// Dev/Prod/etc
    //   'App-Environment': _appDetails.environment.toString(),
    // };

    // if (apiKey != null && apiKey!.isNotEmpty) {
    //   headers[HttpHeaders.authorizationHeader] = 'Token $apiKey';
    // }
    final headers = headersBuilder();
    if (contentType != null) {
      headers[HttpHeaders.contentTypeHeader] = contentType;
    }
    if (accept != null) {
      headers[HttpHeaders.acceptHeader] = accept;
    }
    return headers;
  }

  String _finishUrl(ApiRequest request) {
    String url = '$apiBaseUrl/${request.url.value}';
    if (forceEndingSlash && !url.endsWith('/')) {
      url = '$url/';
    }
    if (request is ReadApiRequest &&
        request.params != null &&
        request.params!.isNotEmpty) {
      url = '$url${Uri(queryParameters: request.params)}';
    }
    return url;
  }

  /// Sends a DELETE request via the [RequestDelegate].
  Future<ApiResponse> delete(WriteApiRequest request) async {
    final headers = getDefaultHeaders();

    final result = await _delegate.delete(
      _finishUrl(request),
      headers: headers,
    );
    _print('  ${result.statusCode} (${result.responseTime}) :: $request');
    return result;
  }

  /// Sends a GET request via the [RequestDelegate].
  Future<ApiResponse> get(ReadApiRequest request) async {
    final headers = getDefaultHeaders();

    final url = _finishUrl(request);
    final result = await _delegate.get(url, headers: headers);
    _print('  ${result.statusCode} (${result.responseTime}) :: $request');
    return result;
  }

  /// Sends a POST request via the [RequestDelegate].
  Future<ApiResponse> post(WriteApiRequest request) async {
    final headers = getDefaultHeaders(
      contentType: request.contentType,
    );

    final result = await _delegate.post(
      _finishUrl(request),
      body: request.body is! String ? jsonEncode(request.body) : request.body,
      headers: headers,
    );
    _print('  ${result.statusCode} (${result.responseTime}) :: $request');
    return result;
  }

  /// Sends a PUT or PATCH request via the [RequestDelegate].
  Future<ApiResponse> update(
    WriteApiRequest request, {
    bool partial = false,
  }) async {
    final headers = getDefaultHeaders();

    final fn = partial ? _delegate.patch : _delegate.put;

    final result = await fn(
      _finishUrl(request),
      body: request.body,
      headers: headers,
    );
    _print('  ${result.statusCode} (${result.responseTime}) :: $request');
    return result;
  }
}
