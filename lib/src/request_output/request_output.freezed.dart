// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RequestOutput<D> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(D data) success,
    required TResult Function(StatusCodeFailure err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(D data)? success,
    TResult? Function(StatusCodeFailure err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(D data)? success,
    TResult Function(StatusCodeFailure err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessData<D> value) success,
    required TResult Function(Error<D> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessData<D> value)? success,
    TResult? Function(Error<D> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessData<D> value)? success,
    TResult Function(Error<D> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOutputCopyWith<D, $Res> {
  factory $RequestOutputCopyWith(
          RequestOutput<D> value, $Res Function(RequestOutput<D>) then) =
      _$RequestOutputCopyWithImpl<D, $Res, RequestOutput<D>>;
}

/// @nodoc
class _$RequestOutputCopyWithImpl<D, $Res, $Val extends RequestOutput<D>>
    implements $RequestOutputCopyWith<D, $Res> {
  _$RequestOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestOutput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SuccessDataImplCopyWith<D, $Res> {
  factory _$$SuccessDataImplCopyWith(_$SuccessDataImpl<D> value,
          $Res Function(_$SuccessDataImpl<D>) then) =
      __$$SuccessDataImplCopyWithImpl<D, $Res>;
  @useResult
  $Res call({D data});
}

/// @nodoc
class __$$SuccessDataImplCopyWithImpl<D, $Res>
    extends _$RequestOutputCopyWithImpl<D, $Res, _$SuccessDataImpl<D>>
    implements _$$SuccessDataImplCopyWith<D, $Res> {
  __$$SuccessDataImplCopyWithImpl(
      _$SuccessDataImpl<D> _value, $Res Function(_$SuccessDataImpl<D>) _then)
      : super(_value, _then);

  /// Create a copy of RequestOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessDataImpl<D>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as D,
    ));
  }
}

/// @nodoc

class _$SuccessDataImpl<D> extends SuccessData<D> {
  const _$SuccessDataImpl(this.data) : super._();

  @override
  final D data;

  @override
  String toString() {
    return 'RequestOutput<$D>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessDataImpl<D> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of RequestOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessDataImplCopyWith<D, _$SuccessDataImpl<D>> get copyWith =>
      __$$SuccessDataImplCopyWithImpl<D, _$SuccessDataImpl<D>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(D data) success,
    required TResult Function(StatusCodeFailure err) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(D data)? success,
    TResult? Function(StatusCodeFailure err)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(D data)? success,
    TResult Function(StatusCodeFailure err)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessData<D> value) success,
    required TResult Function(Error<D> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessData<D> value)? success,
    TResult? Function(Error<D> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessData<D> value)? success,
    TResult Function(Error<D> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessData<D> extends RequestOutput<D> {
  const factory SuccessData(final D data) = _$SuccessDataImpl<D>;
  const SuccessData._() : super._();

  D get data;

  /// Create a copy of RequestOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessDataImplCopyWith<D, _$SuccessDataImpl<D>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<D, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<D> value, $Res Function(_$ErrorImpl<D>) then) =
      __$$ErrorImplCopyWithImpl<D, $Res>;
  @useResult
  $Res call({StatusCodeFailure err});

  $StatusCodeFailureCopyWith<$Res> get err;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<D, $Res>
    extends _$RequestOutputCopyWithImpl<D, $Res, _$ErrorImpl<D>>
    implements _$$ErrorImplCopyWith<D, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<D> _value, $Res Function(_$ErrorImpl<D>) _then)
      : super(_value, _then);

  /// Create a copy of RequestOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$ErrorImpl<D>(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as StatusCodeFailure,
    ));
  }

  /// Create a copy of RequestOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCodeFailureCopyWith<$Res> get err {
    return $StatusCodeFailureCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$ErrorImpl<D> extends Error<D> {
  const _$ErrorImpl(this.err) : super._();

  @override
  final StatusCodeFailure err;

  @override
  String toString() {
    return 'RequestOutput<$D>.error(err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<D> &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  /// Create a copy of RequestOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<D, _$ErrorImpl<D>> get copyWith =>
      __$$ErrorImplCopyWithImpl<D, _$ErrorImpl<D>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(D data) success,
    required TResult Function(StatusCodeFailure err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(D data)? success,
    TResult? Function(StatusCodeFailure err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(D data)? success,
    TResult Function(StatusCodeFailure err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessData<D> value) success,
    required TResult Function(Error<D> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessData<D> value)? success,
    TResult? Function(Error<D> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessData<D> value)? success,
    TResult Function(Error<D> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<D> extends RequestOutput<D> {
  const factory Error(final StatusCodeFailure err) = _$ErrorImpl<D>;
  const Error._() : super._();

  StatusCodeFailure get err;

  /// Create a copy of RequestOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<D, _$ErrorImpl<D>> get copyWith =>
      throw _privateConstructorUsedError;
}
