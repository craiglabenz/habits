import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:meta/meta.dart';

/// {@template ApiRequest}
/// Container for information needed to submit a network request.
/// {@endtemplate}
abstract class ApiRequest {
  /// {@macro ApiRequest}
  const ApiRequest({
    required this.url,
    Headers headers = const {},
  }) : _headers = headers;

  /// Destination of this request.
  final ApiUrl url;

  /// Default content type header.
  String get contentType => 'application/json';

  /// Starter headers for this request.
  final Headers _headers;

  /// Finalized headers, combining starter headers with the builder method.
  Headers get headers => buildHeaders();

  /// Returns complete map of HTTP headers for this request.
  @mustCallSuper
  Headers buildHeaders() {
    // ignore: omit_local_variable_types
    final Headers headers = Map<String, String>.from(_headers);
    headers['Content-Type'] = contentType;
    return headers;
  }
}

/// {@template ReadApiRequest}
/// Subtype of [ApiRequest] for read, or GET requests. Along with having that
/// HTTP verb, these requests also have querystrings and not request bodies.
/// {@endtemplate}
class ReadApiRequest extends ApiRequest {
  /// {@macro ReadApiRequest}
  const ReadApiRequest({
    required super.url,
    super.headers,
    this.params,
  });

  /// GET/querystring-style payload of this request.
  final Params? params;
}

/// {@template WriteApiRequest}
/// Subtype of [ApiRequest] for write, or POST/PATCH/PUT requests. Along with
/// having one of those HTTP verbs, these requests also have request bodies and
/// not querystrings.
/// {@endtemplate}
class WriteApiRequest extends ApiRequest {
  /// {@macro WriteApiRequest}
  const WriteApiRequest({
    required super.url,
    required this.body,
    super.headers,
  });

  /// Request payload in serialized JSON format.
  final Json? body;
}
