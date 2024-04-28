// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TestModelFilter {
  String get match => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String match) messageEquals,
    required TResult Function(String match) messageStartsWith,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String match)? messageEquals,
    TResult? Function(String match)? messageStartsWith,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String match)? messageEquals,
    TResult Function(String match)? messageStartsWith,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TestModelMessageEquals value) messageEquals,
    required TResult Function(TestModelMessageStartsWith value)
        messageStartsWith,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TestModelMessageEquals value)? messageEquals,
    TResult? Function(TestModelMessageStartsWith value)? messageStartsWith,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TestModelMessageEquals value)? messageEquals,
    TResult Function(TestModelMessageStartsWith value)? messageStartsWith,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TestModelFilterCopyWith<TestModelFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestModelFilterCopyWith<$Res> {
  factory $TestModelFilterCopyWith(
          TestModelFilter value, $Res Function(TestModelFilter) then) =
      _$TestModelFilterCopyWithImpl<$Res, TestModelFilter>;
  @useResult
  $Res call({String match});
}

/// @nodoc
class _$TestModelFilterCopyWithImpl<$Res, $Val extends TestModelFilter>
    implements $TestModelFilterCopyWith<$Res> {
  _$TestModelFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
  }) {
    return _then(_value.copyWith(
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestModelMessageEqualsImplCopyWith<$Res>
    implements $TestModelFilterCopyWith<$Res> {
  factory _$$TestModelMessageEqualsImplCopyWith(
          _$TestModelMessageEqualsImpl value,
          $Res Function(_$TestModelMessageEqualsImpl) then) =
      __$$TestModelMessageEqualsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String match});
}

/// @nodoc
class __$$TestModelMessageEqualsImplCopyWithImpl<$Res>
    extends _$TestModelFilterCopyWithImpl<$Res, _$TestModelMessageEqualsImpl>
    implements _$$TestModelMessageEqualsImplCopyWith<$Res> {
  __$$TestModelMessageEqualsImplCopyWithImpl(
      _$TestModelMessageEqualsImpl _value,
      $Res Function(_$TestModelMessageEqualsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
  }) {
    return _then(_$TestModelMessageEqualsImpl(
      null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TestModelMessageEqualsImpl extends TestModelMessageEquals {
  const _$TestModelMessageEqualsImpl(this.match) : super._();

  @override
  final String match;

  @override
  String toString() {
    return 'TestModelFilter.messageEquals(match: $match)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestModelMessageEqualsImpl &&
            (identical(other.match, match) || other.match == match));
  }

  @override
  int get hashCode => Object.hash(runtimeType, match);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestModelMessageEqualsImplCopyWith<_$TestModelMessageEqualsImpl>
      get copyWith => __$$TestModelMessageEqualsImplCopyWithImpl<
          _$TestModelMessageEqualsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String match) messageEquals,
    required TResult Function(String match) messageStartsWith,
  }) {
    return messageEquals(match);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String match)? messageEquals,
    TResult? Function(String match)? messageStartsWith,
  }) {
    return messageEquals?.call(match);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String match)? messageEquals,
    TResult Function(String match)? messageStartsWith,
    required TResult orElse(),
  }) {
    if (messageEquals != null) {
      return messageEquals(match);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TestModelMessageEquals value) messageEquals,
    required TResult Function(TestModelMessageStartsWith value)
        messageStartsWith,
  }) {
    return messageEquals(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TestModelMessageEquals value)? messageEquals,
    TResult? Function(TestModelMessageStartsWith value)? messageStartsWith,
  }) {
    return messageEquals?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TestModelMessageEquals value)? messageEquals,
    TResult Function(TestModelMessageStartsWith value)? messageStartsWith,
    required TResult orElse(),
  }) {
    if (messageEquals != null) {
      return messageEquals(this);
    }
    return orElse();
  }
}

abstract class TestModelMessageEquals extends TestModelFilter {
  const factory TestModelMessageEquals(final String match) =
      _$TestModelMessageEqualsImpl;
  const TestModelMessageEquals._() : super._();

  @override
  String get match;
  @override
  @JsonKey(ignore: true)
  _$$TestModelMessageEqualsImplCopyWith<_$TestModelMessageEqualsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TestModelMessageStartsWithImplCopyWith<$Res>
    implements $TestModelFilterCopyWith<$Res> {
  factory _$$TestModelMessageStartsWithImplCopyWith(
          _$TestModelMessageStartsWithImpl value,
          $Res Function(_$TestModelMessageStartsWithImpl) then) =
      __$$TestModelMessageStartsWithImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String match});
}

/// @nodoc
class __$$TestModelMessageStartsWithImplCopyWithImpl<$Res>
    extends _$TestModelFilterCopyWithImpl<$Res,
        _$TestModelMessageStartsWithImpl>
    implements _$$TestModelMessageStartsWithImplCopyWith<$Res> {
  __$$TestModelMessageStartsWithImplCopyWithImpl(
      _$TestModelMessageStartsWithImpl _value,
      $Res Function(_$TestModelMessageStartsWithImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
  }) {
    return _then(_$TestModelMessageStartsWithImpl(
      null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TestModelMessageStartsWithImpl extends TestModelMessageStartsWith {
  const _$TestModelMessageStartsWithImpl(this.match) : super._();

  @override
  final String match;

  @override
  String toString() {
    return 'TestModelFilter.messageStartsWith(match: $match)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestModelMessageStartsWithImpl &&
            (identical(other.match, match) || other.match == match));
  }

  @override
  int get hashCode => Object.hash(runtimeType, match);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestModelMessageStartsWithImplCopyWith<_$TestModelMessageStartsWithImpl>
      get copyWith => __$$TestModelMessageStartsWithImplCopyWithImpl<
          _$TestModelMessageStartsWithImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String match) messageEquals,
    required TResult Function(String match) messageStartsWith,
  }) {
    return messageStartsWith(match);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String match)? messageEquals,
    TResult? Function(String match)? messageStartsWith,
  }) {
    return messageStartsWith?.call(match);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String match)? messageEquals,
    TResult Function(String match)? messageStartsWith,
    required TResult orElse(),
  }) {
    if (messageStartsWith != null) {
      return messageStartsWith(match);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TestModelMessageEquals value) messageEquals,
    required TResult Function(TestModelMessageStartsWith value)
        messageStartsWith,
  }) {
    return messageStartsWith(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TestModelMessageEquals value)? messageEquals,
    TResult? Function(TestModelMessageStartsWith value)? messageStartsWith,
  }) {
    return messageStartsWith?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TestModelMessageEquals value)? messageEquals,
    TResult Function(TestModelMessageStartsWith value)? messageStartsWith,
    required TResult orElse(),
  }) {
    if (messageStartsWith != null) {
      return messageStartsWith(this);
    }
    return orElse();
  }
}

abstract class TestModelMessageStartsWith extends TestModelFilter {
  const factory TestModelMessageStartsWith(final String match) =
      _$TestModelMessageStartsWithImpl;
  const TestModelMessageStartsWith._() : super._();

  @override
  String get match;
  @override
  @JsonKey(ignore: true)
  _$$TestModelMessageStartsWithImplCopyWith<_$TestModelMessageStartsWithImpl>
      get copyWith => throw _privateConstructorUsedError;
}
