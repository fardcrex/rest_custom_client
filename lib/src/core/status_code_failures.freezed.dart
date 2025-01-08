// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_code_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatusCodeFailure {
  int get statusCode => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode, dynamic data) errors500,
    required TResult Function(int statusCode, dynamic data) errors400,
    required TResult Function(int statusCode, dynamic data) errors300,
    required TResult Function(int statusCode, dynamic data) other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int statusCode, dynamic data)? errors500,
    TResult? Function(int statusCode, dynamic data)? errors400,
    TResult? Function(int statusCode, dynamic data)? errors300,
    TResult? Function(int statusCode, dynamic data)? other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode, dynamic data)? errors500,
    TResult Function(int statusCode, dynamic data)? errors400,
    TResult Function(int statusCode, dynamic data)? errors300,
    TResult Function(int statusCode, dynamic data)? other,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Errors500 value) errors500,
    required TResult Function(Errors400 value) errors400,
    required TResult Function(Errors300 value) errors300,
    required TResult Function(Unknow value) other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Errors500 value)? errors500,
    TResult? Function(Errors400 value)? errors400,
    TResult? Function(Errors300 value)? errors300,
    TResult? Function(Unknow value)? other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Errors500 value)? errors500,
    TResult Function(Errors400 value)? errors400,
    TResult Function(Errors300 value)? errors300,
    TResult Function(Unknow value)? other,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatusCodeFailureCopyWith<StatusCodeFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCodeFailureCopyWith<$Res> {
  factory $StatusCodeFailureCopyWith(
          StatusCodeFailure value, $Res Function(StatusCodeFailure) then) =
      _$StatusCodeFailureCopyWithImpl<$Res, StatusCodeFailure>;
  @useResult
  $Res call({int statusCode, dynamic data});
}

/// @nodoc
class _$StatusCodeFailureCopyWithImpl<$Res, $Val extends StatusCodeFailure>
    implements $StatusCodeFailureCopyWith<$Res> {
  _$StatusCodeFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Errors500ImplCopyWith<$Res>
    implements $StatusCodeFailureCopyWith<$Res> {
  factory _$$Errors500ImplCopyWith(
          _$Errors500Impl value, $Res Function(_$Errors500Impl) then) =
      __$$Errors500ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, dynamic data});
}

/// @nodoc
class __$$Errors500ImplCopyWithImpl<$Res>
    extends _$StatusCodeFailureCopyWithImpl<$Res, _$Errors500Impl>
    implements _$$Errors500ImplCopyWith<$Res> {
  __$$Errors500ImplCopyWithImpl(
      _$Errors500Impl _value, $Res Function(_$Errors500Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? data = freezed,
  }) {
    return _then(_$Errors500Impl(
      null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$Errors500Impl implements Errors500 {
  const _$Errors500Impl(this.statusCode, this.data);

  @override
  final int statusCode;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'StatusCodeFailure.errors500(statusCode: $statusCode, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Errors500Impl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Errors500ImplCopyWith<_$Errors500Impl> get copyWith =>
      __$$Errors500ImplCopyWithImpl<_$Errors500Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode, dynamic data) errors500,
    required TResult Function(int statusCode, dynamic data) errors400,
    required TResult Function(int statusCode, dynamic data) errors300,
    required TResult Function(int statusCode, dynamic data) other,
  }) {
    return errors500(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int statusCode, dynamic data)? errors500,
    TResult? Function(int statusCode, dynamic data)? errors400,
    TResult? Function(int statusCode, dynamic data)? errors300,
    TResult? Function(int statusCode, dynamic data)? other,
  }) {
    return errors500?.call(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode, dynamic data)? errors500,
    TResult Function(int statusCode, dynamic data)? errors400,
    TResult Function(int statusCode, dynamic data)? errors300,
    TResult Function(int statusCode, dynamic data)? other,
    required TResult orElse(),
  }) {
    if (errors500 != null) {
      return errors500(statusCode, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Errors500 value) errors500,
    required TResult Function(Errors400 value) errors400,
    required TResult Function(Errors300 value) errors300,
    required TResult Function(Unknow value) other,
  }) {
    return errors500(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Errors500 value)? errors500,
    TResult? Function(Errors400 value)? errors400,
    TResult? Function(Errors300 value)? errors300,
    TResult? Function(Unknow value)? other,
  }) {
    return errors500?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Errors500 value)? errors500,
    TResult Function(Errors400 value)? errors400,
    TResult Function(Errors300 value)? errors300,
    TResult Function(Unknow value)? other,
    required TResult orElse(),
  }) {
    if (errors500 != null) {
      return errors500(this);
    }
    return orElse();
  }
}

abstract class Errors500 implements StatusCodeFailure {
  const factory Errors500(final int statusCode, final dynamic data) =
      _$Errors500Impl;

  @override
  int get statusCode;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$Errors500ImplCopyWith<_$Errors500Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Errors400ImplCopyWith<$Res>
    implements $StatusCodeFailureCopyWith<$Res> {
  factory _$$Errors400ImplCopyWith(
          _$Errors400Impl value, $Res Function(_$Errors400Impl) then) =
      __$$Errors400ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, dynamic data});
}

/// @nodoc
class __$$Errors400ImplCopyWithImpl<$Res>
    extends _$StatusCodeFailureCopyWithImpl<$Res, _$Errors400Impl>
    implements _$$Errors400ImplCopyWith<$Res> {
  __$$Errors400ImplCopyWithImpl(
      _$Errors400Impl _value, $Res Function(_$Errors400Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? data = freezed,
  }) {
    return _then(_$Errors400Impl(
      null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$Errors400Impl implements Errors400 {
  const _$Errors400Impl(this.statusCode, this.data);

  @override
  final int statusCode;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'StatusCodeFailure.errors400(statusCode: $statusCode, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Errors400Impl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Errors400ImplCopyWith<_$Errors400Impl> get copyWith =>
      __$$Errors400ImplCopyWithImpl<_$Errors400Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode, dynamic data) errors500,
    required TResult Function(int statusCode, dynamic data) errors400,
    required TResult Function(int statusCode, dynamic data) errors300,
    required TResult Function(int statusCode, dynamic data) other,
  }) {
    return errors400(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int statusCode, dynamic data)? errors500,
    TResult? Function(int statusCode, dynamic data)? errors400,
    TResult? Function(int statusCode, dynamic data)? errors300,
    TResult? Function(int statusCode, dynamic data)? other,
  }) {
    return errors400?.call(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode, dynamic data)? errors500,
    TResult Function(int statusCode, dynamic data)? errors400,
    TResult Function(int statusCode, dynamic data)? errors300,
    TResult Function(int statusCode, dynamic data)? other,
    required TResult orElse(),
  }) {
    if (errors400 != null) {
      return errors400(statusCode, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Errors500 value) errors500,
    required TResult Function(Errors400 value) errors400,
    required TResult Function(Errors300 value) errors300,
    required TResult Function(Unknow value) other,
  }) {
    return errors400(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Errors500 value)? errors500,
    TResult? Function(Errors400 value)? errors400,
    TResult? Function(Errors300 value)? errors300,
    TResult? Function(Unknow value)? other,
  }) {
    return errors400?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Errors500 value)? errors500,
    TResult Function(Errors400 value)? errors400,
    TResult Function(Errors300 value)? errors300,
    TResult Function(Unknow value)? other,
    required TResult orElse(),
  }) {
    if (errors400 != null) {
      return errors400(this);
    }
    return orElse();
  }
}

abstract class Errors400 implements StatusCodeFailure {
  const factory Errors400(final int statusCode, final dynamic data) =
      _$Errors400Impl;

  @override
  int get statusCode;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$Errors400ImplCopyWith<_$Errors400Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Errors300ImplCopyWith<$Res>
    implements $StatusCodeFailureCopyWith<$Res> {
  factory _$$Errors300ImplCopyWith(
          _$Errors300Impl value, $Res Function(_$Errors300Impl) then) =
      __$$Errors300ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, dynamic data});
}

/// @nodoc
class __$$Errors300ImplCopyWithImpl<$Res>
    extends _$StatusCodeFailureCopyWithImpl<$Res, _$Errors300Impl>
    implements _$$Errors300ImplCopyWith<$Res> {
  __$$Errors300ImplCopyWithImpl(
      _$Errors300Impl _value, $Res Function(_$Errors300Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? data = freezed,
  }) {
    return _then(_$Errors300Impl(
      null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$Errors300Impl implements Errors300 {
  const _$Errors300Impl(this.statusCode, this.data);

  @override
  final int statusCode;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'StatusCodeFailure.errors300(statusCode: $statusCode, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Errors300Impl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Errors300ImplCopyWith<_$Errors300Impl> get copyWith =>
      __$$Errors300ImplCopyWithImpl<_$Errors300Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode, dynamic data) errors500,
    required TResult Function(int statusCode, dynamic data) errors400,
    required TResult Function(int statusCode, dynamic data) errors300,
    required TResult Function(int statusCode, dynamic data) other,
  }) {
    return errors300(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int statusCode, dynamic data)? errors500,
    TResult? Function(int statusCode, dynamic data)? errors400,
    TResult? Function(int statusCode, dynamic data)? errors300,
    TResult? Function(int statusCode, dynamic data)? other,
  }) {
    return errors300?.call(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode, dynamic data)? errors500,
    TResult Function(int statusCode, dynamic data)? errors400,
    TResult Function(int statusCode, dynamic data)? errors300,
    TResult Function(int statusCode, dynamic data)? other,
    required TResult orElse(),
  }) {
    if (errors300 != null) {
      return errors300(statusCode, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Errors500 value) errors500,
    required TResult Function(Errors400 value) errors400,
    required TResult Function(Errors300 value) errors300,
    required TResult Function(Unknow value) other,
  }) {
    return errors300(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Errors500 value)? errors500,
    TResult? Function(Errors400 value)? errors400,
    TResult? Function(Errors300 value)? errors300,
    TResult? Function(Unknow value)? other,
  }) {
    return errors300?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Errors500 value)? errors500,
    TResult Function(Errors400 value)? errors400,
    TResult Function(Errors300 value)? errors300,
    TResult Function(Unknow value)? other,
    required TResult orElse(),
  }) {
    if (errors300 != null) {
      return errors300(this);
    }
    return orElse();
  }
}

abstract class Errors300 implements StatusCodeFailure {
  const factory Errors300(final int statusCode, final dynamic data) =
      _$Errors300Impl;

  @override
  int get statusCode;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$Errors300ImplCopyWith<_$Errors300Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknowImplCopyWith<$Res>
    implements $StatusCodeFailureCopyWith<$Res> {
  factory _$$UnknowImplCopyWith(
          _$UnknowImpl value, $Res Function(_$UnknowImpl) then) =
      __$$UnknowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, dynamic data});
}

/// @nodoc
class __$$UnknowImplCopyWithImpl<$Res>
    extends _$StatusCodeFailureCopyWithImpl<$Res, _$UnknowImpl>
    implements _$$UnknowImplCopyWith<$Res> {
  __$$UnknowImplCopyWithImpl(
      _$UnknowImpl _value, $Res Function(_$UnknowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? data = freezed,
  }) {
    return _then(_$UnknowImpl(
      null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$UnknowImpl implements Unknow {
  const _$UnknowImpl(this.statusCode, this.data);

  @override
  final int statusCode;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'StatusCodeFailure.other(statusCode: $statusCode, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknowImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknowImplCopyWith<_$UnknowImpl> get copyWith =>
      __$$UnknowImplCopyWithImpl<_$UnknowImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode, dynamic data) errors500,
    required TResult Function(int statusCode, dynamic data) errors400,
    required TResult Function(int statusCode, dynamic data) errors300,
    required TResult Function(int statusCode, dynamic data) other,
  }) {
    return other(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int statusCode, dynamic data)? errors500,
    TResult? Function(int statusCode, dynamic data)? errors400,
    TResult? Function(int statusCode, dynamic data)? errors300,
    TResult? Function(int statusCode, dynamic data)? other,
  }) {
    return other?.call(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode, dynamic data)? errors500,
    TResult Function(int statusCode, dynamic data)? errors400,
    TResult Function(int statusCode, dynamic data)? errors300,
    TResult Function(int statusCode, dynamic data)? other,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(statusCode, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Errors500 value) errors500,
    required TResult Function(Errors400 value) errors400,
    required TResult Function(Errors300 value) errors300,
    required TResult Function(Unknow value) other,
  }) {
    return other(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Errors500 value)? errors500,
    TResult? Function(Errors400 value)? errors400,
    TResult? Function(Errors300 value)? errors300,
    TResult? Function(Unknow value)? other,
  }) {
    return other?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Errors500 value)? errors500,
    TResult Function(Errors400 value)? errors400,
    TResult Function(Errors300 value)? errors300,
    TResult Function(Unknow value)? other,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(this);
    }
    return orElse();
  }
}

abstract class Unknow implements StatusCodeFailure {
  const factory Unknow(final int statusCode, final dynamic data) = _$UnknowImpl;

  @override
  int get statusCode;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$UnknowImplCopyWith<_$UnknowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
