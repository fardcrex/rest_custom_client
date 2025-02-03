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
  dynamic get extra => throw _privateConstructorUsedError;

  /// Create a copy of StatusCodeFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusCodeFailureCopyWith<StatusCodeFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCodeFailureCopyWith<$Res> {
  factory $StatusCodeFailureCopyWith(
          StatusCodeFailure value, $Res Function(StatusCodeFailure) then) =
      _$StatusCodeFailureCopyWithImpl<$Res, StatusCodeFailure>;
  @useResult
  $Res call({int statusCode, dynamic data, dynamic extra});
}

/// @nodoc
class _$StatusCodeFailureCopyWithImpl<$Res, $Val extends StatusCodeFailure>
    implements $StatusCodeFailureCopyWith<$Res> {
  _$StatusCodeFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusCodeFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? data = freezed,
    Object? extra = freezed,
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
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusCodeFailureImplCopyWith<$Res>
    implements $StatusCodeFailureCopyWith<$Res> {
  factory _$$StatusCodeFailureImplCopyWith(_$StatusCodeFailureImpl value,
          $Res Function(_$StatusCodeFailureImpl) then) =
      __$$StatusCodeFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, dynamic data, dynamic extra});
}

/// @nodoc
class __$$StatusCodeFailureImplCopyWithImpl<$Res>
    extends _$StatusCodeFailureCopyWithImpl<$Res, _$StatusCodeFailureImpl>
    implements _$$StatusCodeFailureImplCopyWith<$Res> {
  __$$StatusCodeFailureImplCopyWithImpl(_$StatusCodeFailureImpl _value,
      $Res Function(_$StatusCodeFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatusCodeFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? data = freezed,
    Object? extra = freezed,
  }) {
    return _then(_$StatusCodeFailureImpl(
      null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$StatusCodeFailureImpl implements _StatusCodeFailure {
  const _$StatusCodeFailureImpl(this.statusCode, this.data, this.extra);

  @override
  final int statusCode;
  @override
  final dynamic data;
  @override
  final dynamic extra;

  @override
  String toString() {
    return 'StatusCodeFailure(statusCode: $statusCode, data: $data, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusCodeFailureImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.extra, extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(extra));

  /// Create a copy of StatusCodeFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusCodeFailureImplCopyWith<_$StatusCodeFailureImpl> get copyWith =>
      __$$StatusCodeFailureImplCopyWithImpl<_$StatusCodeFailureImpl>(
          this, _$identity);
}

abstract class _StatusCodeFailure implements StatusCodeFailure {
  const factory _StatusCodeFailure(
          final int statusCode, final dynamic data, final dynamic extra) =
      _$StatusCodeFailureImpl;

  @override
  int get statusCode;
  @override
  dynamic get data;
  @override
  dynamic get extra;

  /// Create a copy of StatusCodeFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusCodeFailureImplCopyWith<_$StatusCodeFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
