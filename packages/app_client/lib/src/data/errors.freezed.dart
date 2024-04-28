// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvalidValueError _$InvalidValueErrorFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'invalidApiKey':
      return InvalidApiKey.fromJson(json);
    case 'invalidEmail':
      return InvalidEmail.fromJson(json);
    case 'passwordTooShort':
      return PasswordTooShort.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'InvalidValueError',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$InvalidValueError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidApiKey,
    required TResult Function() invalidEmail,
    required TResult Function(int minimumLength) passwordTooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidApiKey,
    TResult? Function()? invalidEmail,
    TResult? Function(int minimumLength)? passwordTooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidApiKey,
    TResult Function()? invalidEmail,
    TResult Function(int minimumLength)? passwordTooShort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidApiKey value) invalidApiKey,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(PasswordTooShort value) passwordTooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidApiKey value)? invalidApiKey,
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(PasswordTooShort value)? passwordTooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidApiKey value)? invalidApiKey,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(PasswordTooShort value)? passwordTooShort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidValueErrorCopyWith<$Res> {
  factory $InvalidValueErrorCopyWith(
          InvalidValueError value, $Res Function(InvalidValueError) then) =
      _$InvalidValueErrorCopyWithImpl<$Res, InvalidValueError>;
}

/// @nodoc
class _$InvalidValueErrorCopyWithImpl<$Res, $Val extends InvalidValueError>
    implements $InvalidValueErrorCopyWith<$Res> {
  _$InvalidValueErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InvalidApiKeyImplCopyWith<$Res> {
  factory _$$InvalidApiKeyImplCopyWith(
          _$InvalidApiKeyImpl value, $Res Function(_$InvalidApiKeyImpl) then) =
      __$$InvalidApiKeyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidApiKeyImplCopyWithImpl<$Res>
    extends _$InvalidValueErrorCopyWithImpl<$Res, _$InvalidApiKeyImpl>
    implements _$$InvalidApiKeyImplCopyWith<$Res> {
  __$$InvalidApiKeyImplCopyWithImpl(
      _$InvalidApiKeyImpl _value, $Res Function(_$InvalidApiKeyImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$InvalidApiKeyImpl extends InvalidApiKey {
  const _$InvalidApiKeyImpl({final String? $type})
      : $type = $type ?? 'invalidApiKey',
        super._();

  factory _$InvalidApiKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvalidApiKeyImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InvalidValueError.invalidApiKey()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidApiKeyImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidApiKey,
    required TResult Function() invalidEmail,
    required TResult Function(int minimumLength) passwordTooShort,
  }) {
    return invalidApiKey();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidApiKey,
    TResult? Function()? invalidEmail,
    TResult? Function(int minimumLength)? passwordTooShort,
  }) {
    return invalidApiKey?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidApiKey,
    TResult Function()? invalidEmail,
    TResult Function(int minimumLength)? passwordTooShort,
    required TResult orElse(),
  }) {
    if (invalidApiKey != null) {
      return invalidApiKey();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidApiKey value) invalidApiKey,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(PasswordTooShort value) passwordTooShort,
  }) {
    return invalidApiKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidApiKey value)? invalidApiKey,
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(PasswordTooShort value)? passwordTooShort,
  }) {
    return invalidApiKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidApiKey value)? invalidApiKey,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(PasswordTooShort value)? passwordTooShort,
    required TResult orElse(),
  }) {
    if (invalidApiKey != null) {
      return invalidApiKey(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InvalidApiKeyImplToJson(
      this,
    );
  }
}

abstract class InvalidApiKey extends InvalidValueError {
  const factory InvalidApiKey() = _$InvalidApiKeyImpl;
  const InvalidApiKey._() : super._();

  factory InvalidApiKey.fromJson(Map<String, dynamic> json) =
      _$InvalidApiKeyImpl.fromJson;
}

/// @nodoc
abstract class _$$InvalidEmailImplCopyWith<$Res> {
  factory _$$InvalidEmailImplCopyWith(
          _$InvalidEmailImpl value, $Res Function(_$InvalidEmailImpl) then) =
      __$$InvalidEmailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidEmailImplCopyWithImpl<$Res>
    extends _$InvalidValueErrorCopyWithImpl<$Res, _$InvalidEmailImpl>
    implements _$$InvalidEmailImplCopyWith<$Res> {
  __$$InvalidEmailImplCopyWithImpl(
      _$InvalidEmailImpl _value, $Res Function(_$InvalidEmailImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$InvalidEmailImpl extends InvalidEmail {
  const _$InvalidEmailImpl({final String? $type})
      : $type = $type ?? 'invalidEmail',
        super._();

  factory _$InvalidEmailImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvalidEmailImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InvalidValueError.invalidEmail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidEmailImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidApiKey,
    required TResult Function() invalidEmail,
    required TResult Function(int minimumLength) passwordTooShort,
  }) {
    return invalidEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidApiKey,
    TResult? Function()? invalidEmail,
    TResult? Function(int minimumLength)? passwordTooShort,
  }) {
    return invalidEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidApiKey,
    TResult Function()? invalidEmail,
    TResult Function(int minimumLength)? passwordTooShort,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidApiKey value) invalidApiKey,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(PasswordTooShort value) passwordTooShort,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidApiKey value)? invalidApiKey,
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(PasswordTooShort value)? passwordTooShort,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidApiKey value)? invalidApiKey,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(PasswordTooShort value)? passwordTooShort,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InvalidEmailImplToJson(
      this,
    );
  }
}

abstract class InvalidEmail extends InvalidValueError {
  const factory InvalidEmail() = _$InvalidEmailImpl;
  const InvalidEmail._() : super._();

  factory InvalidEmail.fromJson(Map<String, dynamic> json) =
      _$InvalidEmailImpl.fromJson;
}

/// @nodoc
abstract class _$$PasswordTooShortImplCopyWith<$Res> {
  factory _$$PasswordTooShortImplCopyWith(_$PasswordTooShortImpl value,
          $Res Function(_$PasswordTooShortImpl) then) =
      __$$PasswordTooShortImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int minimumLength});
}

/// @nodoc
class __$$PasswordTooShortImplCopyWithImpl<$Res>
    extends _$InvalidValueErrorCopyWithImpl<$Res, _$PasswordTooShortImpl>
    implements _$$PasswordTooShortImplCopyWith<$Res> {
  __$$PasswordTooShortImplCopyWithImpl(_$PasswordTooShortImpl _value,
      $Res Function(_$PasswordTooShortImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minimumLength = null,
  }) {
    return _then(_$PasswordTooShortImpl(
      null == minimumLength
          ? _value.minimumLength
          : minimumLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PasswordTooShortImpl extends PasswordTooShort {
  const _$PasswordTooShortImpl(this.minimumLength, {final String? $type})
      : $type = $type ?? 'passwordTooShort',
        super._();

  factory _$PasswordTooShortImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordTooShortImplFromJson(json);

  @override
  final int minimumLength;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InvalidValueError.passwordTooShort(minimumLength: $minimumLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordTooShortImpl &&
            (identical(other.minimumLength, minimumLength) ||
                other.minimumLength == minimumLength));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minimumLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordTooShortImplCopyWith<_$PasswordTooShortImpl> get copyWith =>
      __$$PasswordTooShortImplCopyWithImpl<_$PasswordTooShortImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidApiKey,
    required TResult Function() invalidEmail,
    required TResult Function(int minimumLength) passwordTooShort,
  }) {
    return passwordTooShort(minimumLength);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidApiKey,
    TResult? Function()? invalidEmail,
    TResult? Function(int minimumLength)? passwordTooShort,
  }) {
    return passwordTooShort?.call(minimumLength);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidApiKey,
    TResult Function()? invalidEmail,
    TResult Function(int minimumLength)? passwordTooShort,
    required TResult orElse(),
  }) {
    if (passwordTooShort != null) {
      return passwordTooShort(minimumLength);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidApiKey value) invalidApiKey,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(PasswordTooShort value) passwordTooShort,
  }) {
    return passwordTooShort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidApiKey value)? invalidApiKey,
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(PasswordTooShort value)? passwordTooShort,
  }) {
    return passwordTooShort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidApiKey value)? invalidApiKey,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(PasswordTooShort value)? passwordTooShort,
    required TResult orElse(),
  }) {
    if (passwordTooShort != null) {
      return passwordTooShort(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordTooShortImplToJson(
      this,
    );
  }
}

abstract class PasswordTooShort extends InvalidValueError {
  const factory PasswordTooShort(final int minimumLength) =
      _$PasswordTooShortImpl;
  const PasswordTooShort._() : super._();

  factory PasswordTooShort.fromJson(Map<String, dynamic> json) =
      _$PasswordTooShortImpl.fromJson;

  int get minimumLength;
  @JsonKey(ignore: true)
  _$$PasswordTooShortImplCopyWith<_$PasswordTooShortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
