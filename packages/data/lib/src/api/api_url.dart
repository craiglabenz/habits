/// {@template ApiUrl}
/// Container for locating resources on the server.
///
/// Usage:
/// ```dart
///  class LoginUrl extends ApiUrl {
///    const LoginUrl() : super(path: 'users/login/');
///  }
///
///  class DynamicUrl extends ApiUrl {
///    const DynamicUrl(this.token) : super(path: 'users/{{token}}/');
///  }
///
///  class RegisterUrl extends ApiUrl {
///    const RegisterUrl() : super(path: 'users/register/');
///  }
///
///  class LogoutUrl extends ApiUrl {
///    const LogoutUrl() : super(path: 'users/logout/');
///  }
/// ```
/// {@endtemplate}
class ApiUrl {
  /// {@macro ApiUrl}
  const ApiUrl({required this.path, this.context = _empty});

  /// Versioning chunk for this Url. Subtypes can override this.
  static const String v1 = 'api/v1';

  /// Chunk of the URL between the host and a possible querystring. May contain
  /// placeholders of the form {{placeholder}} that are hydrated by [context].
  ///
  /// Combined with baseUrl in the RestApi.
  ///
  /// Usage:
  /// ```dart
  ///   final url = MyApiUrl.someType(uri="a/{{value}}/", context=<String, String>{"value": "url"})
  ///   url.value  # api/v1/a/url/
  /// ```
  final String path;

  /// Map of values used to fill placeholders in [uri].
  final Map<String, dynamic> context;

  /// Computed value which flattens the [ApiUrl] into a plain string.
  String get value {
    var url = '${ApiUrl.v1}/$path';
    for (final key in context.keys) {
      if (url.contains('{{$key}}')) {
        url = url.replaceAll('{{$key}}', context[key] as String);
      }
    }
    return url;
  }

  /// Computed property which flattens the [ApiUrl] into a plain string, and
  /// then hydrates that into a [Uri].
  Uri get uri => Uri.parse(value);
}

/// Useful for tests.
class StubUrl extends ApiUrl {
  /// Constructor.
  const StubUrl() : super(path: '/');
}

const Map<String, Object?> _empty = <String, Object?>{};
