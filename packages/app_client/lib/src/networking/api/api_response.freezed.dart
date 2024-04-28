// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiResponseBody {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String html) html,
    required TResult Function(Map<String, Object?> data) json,
    required TResult Function(String text) plainText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String html)? html,
    TResult? Function(Map<String, Object?> data)? json,
    TResult? Function(String text)? plainText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String html)? html,
    TResult Function(Map<String, Object?> data)? json,
    TResult Function(String text)? plainText,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HtmlApiResponseBody value) html,
    required TResult Function(JsonApiResponseBody value) json,
    required TResult Function(PlainTextApiResponseBody value) plainText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HtmlApiResponseBody value)? html,
    TResult? Function(JsonApiResponseBody value)? json,
    TResult? Function(PlainTextApiResponseBody value)? plainText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HtmlApiResponseBody value)? html,
    TResult Function(JsonApiResponseBody value)? json,
    TResult Function(PlainTextApiResponseBody value)? plainText,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseBodyCopyWith<$Res> {
  factory $ApiResponseBodyCopyWith(
          ApiResponseBody value, $Res Function(ApiResponseBody) then) =
      _$ApiResponseBodyCopyWithImpl<$Res, ApiResponseBody>;
}

/// @nodoc
class _$ApiResponseBodyCopyWithImpl<$Res, $Val extends ApiResponseBody>
    implements $ApiResponseBodyCopyWith<$Res> {
  _$ApiResponseBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HtmlApiResponseBodyImplCopyWith<$Res> {
  factory _$$HtmlApiResponseBodyImplCopyWith(_$HtmlApiResponseBodyImpl value,
          $Res Function(_$HtmlApiResponseBodyImpl) then) =
      __$$HtmlApiResponseBodyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String html});
}

/// @nodoc
class __$$HtmlApiResponseBodyImplCopyWithImpl<$Res>
    extends _$ApiResponseBodyCopyWithImpl<$Res, _$HtmlApiResponseBodyImpl>
    implements _$$HtmlApiResponseBodyImplCopyWith<$Res> {
  __$$HtmlApiResponseBodyImplCopyWithImpl(_$HtmlApiResponseBodyImpl _value,
      $Res Function(_$HtmlApiResponseBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? html = null,
  }) {
    return _then(_$HtmlApiResponseBodyImpl(
      null == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HtmlApiResponseBodyImpl implements HtmlApiResponseBody {
  const _$HtmlApiResponseBodyImpl(this.html);

  @override
  final String html;

  @override
  String toString() {
    return 'ApiResponseBody.html(html: $html)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HtmlApiResponseBodyImpl &&
            (identical(other.html, html) || other.html == html));
  }

  @override
  int get hashCode => Object.hash(runtimeType, html);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HtmlApiResponseBodyImplCopyWith<_$HtmlApiResponseBodyImpl> get copyWith =>
      __$$HtmlApiResponseBodyImplCopyWithImpl<_$HtmlApiResponseBodyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String html) html,
    required TResult Function(Map<String, Object?> data) json,
    required TResult Function(String text) plainText,
  }) {
    return html(this.html);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String html)? html,
    TResult? Function(Map<String, Object?> data)? json,
    TResult? Function(String text)? plainText,
  }) {
    return html?.call(this.html);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String html)? html,
    TResult Function(Map<String, Object?> data)? json,
    TResult Function(String text)? plainText,
    required TResult orElse(),
  }) {
    if (html != null) {
      return html(this.html);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HtmlApiResponseBody value) html,
    required TResult Function(JsonApiResponseBody value) json,
    required TResult Function(PlainTextApiResponseBody value) plainText,
  }) {
    return html(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HtmlApiResponseBody value)? html,
    TResult? Function(JsonApiResponseBody value)? json,
    TResult? Function(PlainTextApiResponseBody value)? plainText,
  }) {
    return html?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HtmlApiResponseBody value)? html,
    TResult Function(JsonApiResponseBody value)? json,
    TResult Function(PlainTextApiResponseBody value)? plainText,
    required TResult orElse(),
  }) {
    if (html != null) {
      return html(this);
    }
    return orElse();
  }
}

abstract class HtmlApiResponseBody implements ApiResponseBody {
  const factory HtmlApiResponseBody(final String html) =
      _$HtmlApiResponseBodyImpl;

  String get html;
  @JsonKey(ignore: true)
  _$$HtmlApiResponseBodyImplCopyWith<_$HtmlApiResponseBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JsonApiResponseBodyImplCopyWith<$Res> {
  factory _$$JsonApiResponseBodyImplCopyWith(_$JsonApiResponseBodyImpl value,
          $Res Function(_$JsonApiResponseBodyImpl) then) =
      __$$JsonApiResponseBodyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, Object?> data});
}

/// @nodoc
class __$$JsonApiResponseBodyImplCopyWithImpl<$Res>
    extends _$ApiResponseBodyCopyWithImpl<$Res, _$JsonApiResponseBodyImpl>
    implements _$$JsonApiResponseBodyImplCopyWith<$Res> {
  __$$JsonApiResponseBodyImplCopyWithImpl(_$JsonApiResponseBodyImpl _value,
      $Res Function(_$JsonApiResponseBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$JsonApiResponseBodyImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ));
  }
}

/// @nodoc

class _$JsonApiResponseBodyImpl implements JsonApiResponseBody {
  const _$JsonApiResponseBodyImpl(final Map<String, Object?> data)
      : _data = data;

  final Map<String, Object?> _data;
  @override
  Map<String, Object?> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'ApiResponseBody.json(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsonApiResponseBodyImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JsonApiResponseBodyImplCopyWith<_$JsonApiResponseBodyImpl> get copyWith =>
      __$$JsonApiResponseBodyImplCopyWithImpl<_$JsonApiResponseBodyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String html) html,
    required TResult Function(Map<String, Object?> data) json,
    required TResult Function(String text) plainText,
  }) {
    return json(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String html)? html,
    TResult? Function(Map<String, Object?> data)? json,
    TResult? Function(String text)? plainText,
  }) {
    return json?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String html)? html,
    TResult Function(Map<String, Object?> data)? json,
    TResult Function(String text)? plainText,
    required TResult orElse(),
  }) {
    if (json != null) {
      return json(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HtmlApiResponseBody value) html,
    required TResult Function(JsonApiResponseBody value) json,
    required TResult Function(PlainTextApiResponseBody value) plainText,
  }) {
    return json(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HtmlApiResponseBody value)? html,
    TResult? Function(JsonApiResponseBody value)? json,
    TResult? Function(PlainTextApiResponseBody value)? plainText,
  }) {
    return json?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HtmlApiResponseBody value)? html,
    TResult Function(JsonApiResponseBody value)? json,
    TResult Function(PlainTextApiResponseBody value)? plainText,
    required TResult orElse(),
  }) {
    if (json != null) {
      return json(this);
    }
    return orElse();
  }
}

abstract class JsonApiResponseBody implements ApiResponseBody {
  const factory JsonApiResponseBody(final Map<String, Object?> data) =
      _$JsonApiResponseBodyImpl;

  Map<String, Object?> get data;
  @JsonKey(ignore: true)
  _$$JsonApiResponseBodyImplCopyWith<_$JsonApiResponseBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlainTextApiResponseBodyImplCopyWith<$Res> {
  factory _$$PlainTextApiResponseBodyImplCopyWith(
          _$PlainTextApiResponseBodyImpl value,
          $Res Function(_$PlainTextApiResponseBodyImpl) then) =
      __$$PlainTextApiResponseBodyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$PlainTextApiResponseBodyImplCopyWithImpl<$Res>
    extends _$ApiResponseBodyCopyWithImpl<$Res, _$PlainTextApiResponseBodyImpl>
    implements _$$PlainTextApiResponseBodyImplCopyWith<$Res> {
  __$$PlainTextApiResponseBodyImplCopyWithImpl(
      _$PlainTextApiResponseBodyImpl _value,
      $Res Function(_$PlainTextApiResponseBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$PlainTextApiResponseBodyImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlainTextApiResponseBodyImpl implements PlainTextApiResponseBody {
  const _$PlainTextApiResponseBodyImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'ApiResponseBody.plainText(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlainTextApiResponseBodyImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlainTextApiResponseBodyImplCopyWith<_$PlainTextApiResponseBodyImpl>
      get copyWith => __$$PlainTextApiResponseBodyImplCopyWithImpl<
          _$PlainTextApiResponseBodyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String html) html,
    required TResult Function(Map<String, Object?> data) json,
    required TResult Function(String text) plainText,
  }) {
    return plainText(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String html)? html,
    TResult? Function(Map<String, Object?> data)? json,
    TResult? Function(String text)? plainText,
  }) {
    return plainText?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String html)? html,
    TResult Function(Map<String, Object?> data)? json,
    TResult Function(String text)? plainText,
    required TResult orElse(),
  }) {
    if (plainText != null) {
      return plainText(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HtmlApiResponseBody value) html,
    required TResult Function(JsonApiResponseBody value) json,
    required TResult Function(PlainTextApiResponseBody value) plainText,
  }) {
    return plainText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HtmlApiResponseBody value)? html,
    TResult? Function(JsonApiResponseBody value)? json,
    TResult? Function(PlainTextApiResponseBody value)? plainText,
  }) {
    return plainText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HtmlApiResponseBody value)? html,
    TResult Function(JsonApiResponseBody value)? json,
    TResult Function(PlainTextApiResponseBody value)? plainText,
    required TResult orElse(),
  }) {
    if (plainText != null) {
      return plainText(this);
    }
    return orElse();
  }
}

abstract class PlainTextApiResponseBody implements ApiResponseBody {
  const factory PlainTextApiResponseBody(final String text) =
      _$PlainTextApiResponseBodyImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$PlainTextApiResponseBodyImplCopyWith<_$PlainTextApiResponseBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApiResponse {
  int get statusCode => throw _privateConstructorUsedError;
  Duration get responseTime => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiResponseBody body, int statusCode,
            Duration responseTime, String url)
        success,
    required TResult Function(ErrorMessage error, int statusCode,
            Duration responseTime, String url)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ApiResponseBody body, int statusCode,
            Duration responseTime, String url)?
        success,
    TResult? Function(ErrorMessage error, int statusCode, Duration responseTime,
            String url)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiResponseBody body, int statusCode,
            Duration responseTime, String url)?
        success,
    TResult Function(ErrorMessage error, int statusCode, Duration responseTime,
            String url)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiSuccess value) success,
    required TResult Function(ApiError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiSuccess value)? success,
    TResult? Function(ApiError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiSuccess value)? success,
    TResult Function(ApiError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res, ApiResponse>;
  @useResult
  $Res call({int statusCode, Duration responseTime, String url});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res, $Val extends ApiResponse>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? responseTime = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      responseTime: null == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiSuccessImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiSuccessImplCopyWith(
          _$ApiSuccessImpl value, $Res Function(_$ApiSuccessImpl) then) =
      __$$ApiSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiResponseBody body,
      int statusCode,
      Duration responseTime,
      String url});

  $ApiResponseBodyCopyWith<$Res> get body;
}

/// @nodoc
class __$$ApiSuccessImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiSuccessImpl>
    implements _$$ApiSuccessImplCopyWith<$Res> {
  __$$ApiSuccessImplCopyWithImpl(
      _$ApiSuccessImpl _value, $Res Function(_$ApiSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? statusCode = null,
    Object? responseTime = null,
    Object? url = null,
  }) {
    return _then(_$ApiSuccessImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as ApiResponseBody,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      responseTime: null == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiResponseBodyCopyWith<$Res> get body {
    return $ApiResponseBodyCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value));
    });
  }
}

/// @nodoc

class _$ApiSuccessImpl extends ApiSuccess {
  const _$ApiSuccessImpl(
      {required this.body,
      required this.statusCode,
      required this.responseTime,
      required this.url})
      : super._();

  @override
  final ApiResponseBody body;
  @override
  final int statusCode;
  @override
  final Duration responseTime;
  @override
  final String url;

  @override
  String toString() {
    return 'ApiResponse.success(body: $body, statusCode: $statusCode, responseTime: $responseTime, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiSuccessImpl &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, body, statusCode, responseTime, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiSuccessImplCopyWith<_$ApiSuccessImpl> get copyWith =>
      __$$ApiSuccessImplCopyWithImpl<_$ApiSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiResponseBody body, int statusCode,
            Duration responseTime, String url)
        success,
    required TResult Function(ErrorMessage error, int statusCode,
            Duration responseTime, String url)
        error,
  }) {
    return success(body, statusCode, responseTime, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ApiResponseBody body, int statusCode,
            Duration responseTime, String url)?
        success,
    TResult? Function(ErrorMessage error, int statusCode, Duration responseTime,
            String url)?
        error,
  }) {
    return success?.call(body, statusCode, responseTime, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiResponseBody body, int statusCode,
            Duration responseTime, String url)?
        success,
    TResult Function(ErrorMessage error, int statusCode, Duration responseTime,
            String url)?
        error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(body, statusCode, responseTime, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiSuccess value) success,
    required TResult Function(ApiError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiSuccess value)? success,
    TResult? Function(ApiError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiSuccess value)? success,
    TResult Function(ApiError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ApiSuccess extends ApiResponse {
  const factory ApiSuccess(
      {required final ApiResponseBody body,
      required final int statusCode,
      required final Duration responseTime,
      required final String url}) = _$ApiSuccessImpl;
  const ApiSuccess._() : super._();

  ApiResponseBody get body;
  @override
  int get statusCode;
  @override
  Duration get responseTime;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$ApiSuccessImplCopyWith<_$ApiSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiErrorImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiErrorImplCopyWith(
          _$ApiErrorImpl value, $Res Function(_$ApiErrorImpl) then) =
      __$$ApiErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ErrorMessage error, int statusCode, Duration responseTime, String url});

  $ErrorMessageCopyWith<$Res> get error;
}

/// @nodoc
class __$$ApiErrorImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiErrorImpl>
    implements _$$ApiErrorImplCopyWith<$Res> {
  __$$ApiErrorImplCopyWithImpl(
      _$ApiErrorImpl _value, $Res Function(_$ApiErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? statusCode = null,
    Object? responseTime = null,
    Object? url = null,
  }) {
    return _then(_$ApiErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorMessage,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      responseTime: null == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ErrorMessageCopyWith<$Res> get error {
    return $ErrorMessageCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ApiErrorImpl extends ApiError {
  const _$ApiErrorImpl(
      {required this.error,
      required this.statusCode,
      required this.responseTime,
      required this.url})
      : super._();

  @override
  final ErrorMessage error;
  @override
  final int statusCode;
  @override
  final Duration responseTime;
  @override
  final String url;

  @override
  String toString() {
    return 'ApiResponse.error(error: $error, statusCode: $statusCode, responseTime: $responseTime, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, error, statusCode, responseTime, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      __$$ApiErrorImplCopyWithImpl<_$ApiErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiResponseBody body, int statusCode,
            Duration responseTime, String url)
        success,
    required TResult Function(ErrorMessage error, int statusCode,
            Duration responseTime, String url)
        error,
  }) {
    return error(this.error, statusCode, responseTime, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ApiResponseBody body, int statusCode,
            Duration responseTime, String url)?
        success,
    TResult? Function(ErrorMessage error, int statusCode, Duration responseTime,
            String url)?
        error,
  }) {
    return error?.call(this.error, statusCode, responseTime, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiResponseBody body, int statusCode,
            Duration responseTime, String url)?
        success,
    TResult Function(ErrorMessage error, int statusCode, Duration responseTime,
            String url)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, statusCode, responseTime, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiSuccess value) success,
    required TResult Function(ApiError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiSuccess value)? success,
    TResult? Function(ApiError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiSuccess value)? success,
    TResult Function(ApiError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ApiError extends ApiResponse {
  const factory ApiError(
      {required final ErrorMessage error,
      required final int statusCode,
      required final Duration responseTime,
      required final String url}) = _$ApiErrorImpl;
  const ApiError._() : super._();

  ErrorMessage get error;
  @override
  int get statusCode;
  @override
  Duration get responseTime;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ErrorMessage {
  Object get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) fromString,
    required TResult Function(Map<String, Object?> message) fromMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? fromString,
    TResult? Function(Map<String, Object?> message)? fromMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? fromString,
    TResult Function(Map<String, Object?> message)? fromMap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorString value) fromString,
    required TResult Function(ErrorMap value) fromMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorString value)? fromString,
    TResult? Function(ErrorMap value)? fromMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorString value)? fromString,
    TResult Function(ErrorMap value)? fromMap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorMessageCopyWith<$Res> {
  factory $ErrorMessageCopyWith(
          ErrorMessage value, $Res Function(ErrorMessage) then) =
      _$ErrorMessageCopyWithImpl<$Res, ErrorMessage>;
}

/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res, $Val extends ErrorMessage>
    implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorStringImplCopyWith<$Res> {
  factory _$$ErrorStringImplCopyWith(
          _$ErrorStringImpl value, $Res Function(_$ErrorStringImpl) then) =
      __$$ErrorStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorStringImplCopyWithImpl<$Res>
    extends _$ErrorMessageCopyWithImpl<$Res, _$ErrorStringImpl>
    implements _$$ErrorStringImplCopyWith<$Res> {
  __$$ErrorStringImplCopyWithImpl(
      _$ErrorStringImpl _value, $Res Function(_$ErrorStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorStringImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStringImpl extends ErrorString {
  const _$ErrorStringImpl(this.message) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'ErrorMessage.fromString(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStringImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStringImplCopyWith<_$ErrorStringImpl> get copyWith =>
      __$$ErrorStringImplCopyWithImpl<_$ErrorStringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) fromString,
    required TResult Function(Map<String, Object?> message) fromMap,
  }) {
    return fromString(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? fromString,
    TResult? Function(Map<String, Object?> message)? fromMap,
  }) {
    return fromString?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? fromString,
    TResult Function(Map<String, Object?> message)? fromMap,
    required TResult orElse(),
  }) {
    if (fromString != null) {
      return fromString(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorString value) fromString,
    required TResult Function(ErrorMap value) fromMap,
  }) {
    return fromString(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorString value)? fromString,
    TResult? Function(ErrorMap value)? fromMap,
  }) {
    return fromString?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorString value)? fromString,
    TResult Function(ErrorMap value)? fromMap,
    required TResult orElse(),
  }) {
    if (fromString != null) {
      return fromString(this);
    }
    return orElse();
  }
}

abstract class ErrorString extends ErrorMessage {
  const factory ErrorString(final String message) = _$ErrorStringImpl;
  const ErrorString._() : super._();

  @override
  String get message;
  @JsonKey(ignore: true)
  _$$ErrorStringImplCopyWith<_$ErrorStringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorMapImplCopyWith<$Res> {
  factory _$$ErrorMapImplCopyWith(
          _$ErrorMapImpl value, $Res Function(_$ErrorMapImpl) then) =
      __$$ErrorMapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, Object?> message});
}

/// @nodoc
class __$$ErrorMapImplCopyWithImpl<$Res>
    extends _$ErrorMessageCopyWithImpl<$Res, _$ErrorMapImpl>
    implements _$$ErrorMapImplCopyWith<$Res> {
  __$$ErrorMapImplCopyWithImpl(
      _$ErrorMapImpl _value, $Res Function(_$ErrorMapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorMapImpl(
      null == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ));
  }
}

/// @nodoc

class _$ErrorMapImpl extends ErrorMap {
  const _$ErrorMapImpl(final Map<String, Object?> message)
      : _message = message,
        super._();

  final Map<String, Object?> _message;
  @override
  Map<String, Object?> get message {
    if (_message is EqualUnmodifiableMapView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_message);
  }

  @override
  String toString() {
    return 'ErrorMessage.fromMap(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorMapImpl &&
            const DeepCollectionEquality().equals(other._message, _message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorMapImplCopyWith<_$ErrorMapImpl> get copyWith =>
      __$$ErrorMapImplCopyWithImpl<_$ErrorMapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) fromString,
    required TResult Function(Map<String, Object?> message) fromMap,
  }) {
    return fromMap(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? fromString,
    TResult? Function(Map<String, Object?> message)? fromMap,
  }) {
    return fromMap?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? fromString,
    TResult Function(Map<String, Object?> message)? fromMap,
    required TResult orElse(),
  }) {
    if (fromMap != null) {
      return fromMap(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorString value) fromString,
    required TResult Function(ErrorMap value) fromMap,
  }) {
    return fromMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorString value)? fromString,
    TResult? Function(ErrorMap value)? fromMap,
  }) {
    return fromMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorString value)? fromString,
    TResult Function(ErrorMap value)? fromMap,
    required TResult orElse(),
  }) {
    if (fromMap != null) {
      return fromMap(this);
    }
    return orElse();
  }
}

abstract class ErrorMap extends ErrorMessage {
  const factory ErrorMap(final Map<String, Object?> message) = _$ErrorMapImpl;
  const ErrorMap._() : super._();

  @override
  Map<String, Object?> get message;
  @JsonKey(ignore: true)
  _$$ErrorMapImplCopyWith<_$ErrorMapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
