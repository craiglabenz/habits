import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

/// Typed-container for the response payload for an [ApiResponse].
@Freezed()
class ApiResponseBody with _$ApiResponseBody {
  /// Container for a response body that came with the "text/html" content type.
  const factory ApiResponseBody.html(String html) = HtmlApiResponseBody;

  /// Container for a response body that came with the "application/json"
  /// content type.
  const factory ApiResponseBody.json(Json data) = JsonApiResponseBody;

  /// Container for a response body that came with the "text/plain" content type.
  const factory ApiResponseBody.plainText(String text) =
      PlainTextApiResponseBody;
}

/// Success/failure-aware container for the response from an [ApiRequest].
@Freezed()
class ApiResponse with _$ApiResponse {
  const ApiResponse._();

  /// Container for the response from an [ApiRequest] that did not encounter any
  /// errors.
  const factory ApiResponse.success({
    required ApiResponseBody body,
    required int statusCode,
    required Duration responseTime,
    required String url,
  }) = ApiSuccess;

  /// Container for the response from an [ApiRequest] that encountered errors.
  const factory ApiResponse.error({
    required ErrorMessage error,
    required int statusCode,
    required Duration responseTime,
    required String url,
  }) = ApiError;

  /// Test-friendly constructor for synthetic [ApiResponse] instances.
  factory ApiResponse.fake({
    Map<String, dynamic>? body,
    int? statusCode,
    Duration? responseTime,
    String? url,
  }) =>
      ApiResponse.success(
        body: ApiResponseBody.json(body ?? <String, dynamic>{}),
        statusCode: statusCode ?? 200,
        url: url ?? 'https://fake.com',
        responseTime: responseTime ?? const Duration(milliseconds: 1),
      );

  /// True if this [ApiResponse] is an [ApiSuccess].
  bool get isSuccess => this is ApiSuccess;

  /// Returns the [Json] from an [ApiResponse], or raises if it was unavailable.
  /// Usage of this computed property should only verifiying [isSuccess] is
  /// true.
  Json get jsonOrRaise => map(
        success: (ApiSuccess resp) => resp.body.map(
          html: (HtmlApiResponseBody body) =>
              throw Exception('Received HTML, expected JSON for ${resp.url}'),
          json: (JsonApiResponseBody body) => body.data,
          plainText: (PlainTextApiResponseBody body) =>
              throw Exception('Received text, expected JSON for ${resp.url}'),
        ),
        error: (ApiError resp) =>
            throw Exception('Error response for ${resp.url}'),
      );

  /// Returns the error from an [ApiResponse], or raises if the result was
  /// successful. Usage of this computed property should only verifiying
  /// [isSuccess] is false.
  String get errorString => map(
        success: (ApiSuccess res) =>
            throw Exception('No error string for successful response'),
        error: (ApiError res) =>
            '${res.statusCode} ${res.url} :: ${res.error.plain}',
      );
}

/// Utility to unpack error strings from either a plain string (which is
/// straightforward), or from a map where we assume that the value is the error.
@Freezed()
class ErrorMessage with _$ErrorMessage {
  const ErrorMessage._();

  /// Pass-thru container for a string.
  const factory ErrorMessage.fromString(String message) = ErrorString;

  /// Unpacks an [ErrorMessage] from a [Json] map.
  const factory ErrorMessage.fromMap(Json message) = ErrorMap;

  /// Extracts the raw string from this [ErrorMessage].
  String get plain => when<String>(
        fromString: (String message) => message,
        fromMap: (Json msg) => '${msg.keys.first}: ${msg[msg.keys.first]}',
      );
}
