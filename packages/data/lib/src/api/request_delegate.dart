import 'dart:convert';
import 'package:data/data.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

final _log = Logger('RequestDelegate');

/// {@template UnexpectedRequest}
/// Exception which indicates that a [RequestDelegate] received an [ApiRequest]
/// with an unexpected http verb.
/// {@endtemplate}
class UnexpectedRequest implements Exception {
  /// {@macro UnexpectedRequest}
  UnexpectedRequest(this.message);

  /// Explanation of this error.
  final String message;

  @override
  String toString() => 'UnexpectedRequest($message)';
}

/// GET typedef
/// Represents all requests that lack a `body` component.
typedef ReadHandler = Future<http.Response> Function(
  Uri url, {
  Map<String, String>? headers,
});

/// POST/PUT/PATCH/DELETE typedef
/// Represents all requests that have a `body` component.
typedef WriteRequestHandler = Future<http.Response> Function(
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
});

/// Category of function which can convert an actual [http.Response] object
/// into a domain-logic equivalent, [ApiResponse].
typedef ResponseProcessor = ApiResponse Function(DateTime, http.Response);

Future<http.Response> _unexpectedGet(Uri url, {Map<String, String>? headers}) =>
    throw UnexpectedRequest('Unexpected GET $url');
Future<http.Response> _unexpectedPost(
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
}) =>
    throw UnexpectedRequest('Unexpected POST $url');
Future<http.Response> _unexpectedPut(
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
}) =>
    throw UnexpectedRequest('Unexpected PUT $url');
Future<http.Response> _unexpectedPatch(
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
}) =>
    throw UnexpectedRequest('Unexpected PATCH $url');
Future<http.Response> _unexpectedDelete(
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
}) =>
    throw UnexpectedRequest('Unexpected DELETE $url');

/// {@template RequestDelegate}
/// Utility which can read and write data via the network.
///
/// [RequestDelegate] instances accept a function for each http verb, making
/// them wrappers for the actual [http] library that are suitable for dependency
/// injection and tests.
/// {@endtemplate}
class RequestDelegate {
  /// {@macro RequestDelegate}
  const RequestDelegate._({
    required this.readHandler,
    required this.postHandler,
    required this.putHandler,
    required this.patchHandler,
    required this.deleteHandler,
    required this.responseProcessor,
  });

  /// Live [RequestDelegate] which uses the [http] library to make real
  /// network requests.
  const factory RequestDelegate.live() = _LiveRequestDelegate;

  /// Fake [RequestDelegate] which uses stubs to fake network requests. Omitting
  /// a value for some of the http verbs will cause this fake to throw an
  /// exception if those verbs are invoked, which helps with testing.
  factory RequestDelegate.fake({
    ReadHandler? readHandler,
    WriteRequestHandler? postHandler,
    WriteRequestHandler? putHandler,
    WriteRequestHandler? patchHandler,
    WriteRequestHandler? deleteHandler,
    ResponseProcessor? responseProcessor,
  }) =>
      RequestDelegate._(
        readHandler: readHandler ?? _unexpectedGet,
        postHandler: postHandler ?? _unexpectedPost,
        putHandler: putHandler ?? _unexpectedPut,
        patchHandler: patchHandler ?? _unexpectedPatch,
        deleteHandler: deleteHandler ?? _unexpectedDelete,
        responseProcessor: responseProcessor ?? RequestDelegate.processResponse,
      );

  /// Method to execute GET requests.
  final ReadHandler readHandler;

  /// Method to execute POST requests.
  final WriteRequestHandler postHandler;

  /// Method to execute PUT requests.
  final WriteRequestHandler putHandler;

  /// Method to execute PATCH requests.
  final WriteRequestHandler patchHandler;

  /// Method to execute DELETE requests.
  final WriteRequestHandler deleteHandler;

  /// Method which converts [http.Response] objects into [ApiResponse] objects.
  final ResponseProcessor responseProcessor;

  /// Executes a GET request via [readHandler].
  Future<ApiResponse> get(
    String url, {
    required Map<String, String> headers,
  }) async =>
      responseProcessor(
        DateTime.now(),
        await readHandler(Uri.parse(url), headers: headers),
      );

  /// Executes a DELETE request via [deleteHandler].
  Future<ApiResponse> delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async =>
      responseProcessor(
        DateTime.now(),
        await deleteHandler(
          Uri.parse(url),
          headers: headers,
          body: body,
          encoding: encoding,
        ),
      );

  /// Executes a PATCH request via [patchHandler].
  Future<ApiResponse> patch(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async =>
      responseProcessor(
        DateTime.now(),
        await patchHandler(
          Uri.parse(url),
          headers: headers,
          body: body,
          encoding: encoding,
        ),
      );

  /// Executes a POST request via [postHandler].
  Future<ApiResponse> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return responseProcessor(
      DateTime.now(),
      await postHandler(
        Uri.parse(url),
        headers: headers,
        body: body,
        encoding: encoding,
      ),
    );
  }

  /// Executes a PUT request via [putHandler].
  Future<ApiResponse> put(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async =>
      responseProcessor(
        DateTime.now(),
        await putHandler(
          Uri.parse(url),
          headers: headers,
          body: body,
          encoding: encoding,
        ),
      );

  static const bool _shouldPrint = false;

  static void _print(String msg) {
    if (!RequestDelegate._shouldPrint) return;
    // ignore: avoid_print
    print(msg);
  }

  /// Unpacks an [http.Response] object into an [ApiResponse].
  static ApiResponse processResponse(
    DateTime sentAt,
    http.Response resp,
  ) {
    final responseTime = DateTime.now().difference(sentAt);
    final statusCode = resp.statusCode;
    final is200 = (statusCode - 300) < 0;
    final is300 = !is200 && ((statusCode - 400) < 0);
    final is400 = !is200 && !is300 && (statusCode - 500) < 0;
    final is500 = !is200 && !is300 && !is400 && (statusCode - 500) >= 0;

    final rawResponseBody = utf8.decoder.convert(resp.bodyBytes);
    final contentType =
        resp.headers['content-type'] ?? resp.headers['Content-Type'];
    assert(contentType != null, 'contentType must have a value');

    ApiResponseBody? body;

    if (rawResponseBody.isNotEmpty) {
      if (contentType != null) {
        if (contentType.contains('json')) {
          if (rawResponseBody.startsWith('{') ||
              rawResponseBody.startsWith('[')) {
            try {
              body = ApiResponseBody.json(
                jsonDecode(rawResponseBody) as Map<String, dynamic>,
              );
            } on FormatException {
              return ApiResponse.error(
                error: ErrorMessage.fromString(
                  'Invalid JSON: $rawResponseBody',
                ),
                responseTime: responseTime,
                statusCode: resp.statusCode,
                url: resp.request?.url.toString() ?? '',
              );
            }
          } else {
            body = ApiResponseBody.plainText(rawResponseBody);
          }
        } else if (contentType.contains('html')) {
          body = ApiResponseBody.html(rawResponseBody);
        } else if (contentType.contains('text')) {
          try {
            body = ApiResponseBody.json(
              jsonDecode(rawResponseBody) as Map<String, dynamic>,
            );
            _log.warning(
              'Received valid JSON with content type "$contentType". '
              'Url: ${resp.request?.url}',
            );
          } catch (e) {
            body = ApiResponseBody.plainText(rawResponseBody);
          }
        }
      }
    } else {
      // Empty response?
      body = !is200
          ? ApiResponseBody.json(<String, dynamic>{
              'error': 'Unknown $statusCode Error',
            })
          : const ApiResponseBody.json(<String, dynamic>{});
    }

    assert(body != null, 'body must not be null');

    if (is500) {
      _print('500!');
      _print(resp.body);
    }

    if (is200) {
      return ApiResponse.success(
        body: body!,
        responseTime: responseTime,
        statusCode: resp.statusCode,
        url: resp.request?.url.toString() ?? '',
      );
    }

    // Error time!
    final errorMessage = body!.map(
      html: (HtmlApiResponseBody body) => ErrorMessage.fromString(body.html),
      json: (JsonApiResponseBody body) => ErrorMessage.fromMap(body.data),
      plainText: (PlainTextApiResponseBody body) =>
          ErrorMessage.fromString(body.text),
    );
    // Application.shared.logEvent(
    //   '${resp.statusCode} API Error to ${resp.request.url}: ${error.plain}',
    // );
    return ApiResponse.error(
      error: errorMessage,
      responseTime: responseTime,
      statusCode: resp.statusCode,
      url: resp.request?.url.toString() ?? '',
    );
  }
}

class _LiveRequestDelegate extends RequestDelegate {
  const _LiveRequestDelegate()
      : super._(
          readHandler: http.get,
          postHandler: http.post,
          putHandler: http.put,
          patchHandler: http.patch,
          deleteHandler: http.delete,
          responseProcessor: RequestDelegate.processResponse,
        );
}
