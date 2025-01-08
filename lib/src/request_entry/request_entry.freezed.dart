// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RequestEntry {
  Path get path => throw _privateConstructorUsedError; //   String? token,
  Object? get body => throw _privateConstructorUsedError;
  Map<String, String>? get customHeaders => throw _privateConstructorUsedError;
  Map<String, dynamic>? get queryParameters =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestEntryCopyWith<RequestEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestEntryCopyWith<$Res> {
  factory $RequestEntryCopyWith(
          RequestEntry value, $Res Function(RequestEntry) then) =
      _$RequestEntryCopyWithImpl<$Res, RequestEntry>;
  @useResult
  $Res call(
      {Path path,
      Object? body,
      Map<String, String>? customHeaders,
      Map<String, dynamic>? queryParameters});
}

/// @nodoc
class _$RequestEntryCopyWithImpl<$Res, $Val extends RequestEntry>
    implements $RequestEntryCopyWith<$Res> {
  _$RequestEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? body = freezed,
    Object? customHeaders = freezed,
    Object? queryParameters = freezed,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as Path,
      body: freezed == body ? _value.body : body,
      customHeaders: freezed == customHeaders
          ? _value.customHeaders
          : customHeaders // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      queryParameters: freezed == queryParameters
          ? _value.queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestEntryImplCopyWith<$Res>
    implements $RequestEntryCopyWith<$Res> {
  factory _$$RequestEntryImplCopyWith(
          _$RequestEntryImpl value, $Res Function(_$RequestEntryImpl) then) =
      __$$RequestEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Path path,
      Object? body,
      Map<String, String>? customHeaders,
      Map<String, dynamic>? queryParameters});
}

/// @nodoc
class __$$RequestEntryImplCopyWithImpl<$Res>
    extends _$RequestEntryCopyWithImpl<$Res, _$RequestEntryImpl>
    implements _$$RequestEntryImplCopyWith<$Res> {
  __$$RequestEntryImplCopyWithImpl(
      _$RequestEntryImpl _value, $Res Function(_$RequestEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? body = freezed,
    Object? customHeaders = freezed,
    Object? queryParameters = freezed,
  }) {
    return _then(_$RequestEntryImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as Path,
      body: freezed == body ? _value.body : body,
      customHeaders: freezed == customHeaders
          ? _value._customHeaders
          : customHeaders // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      queryParameters: freezed == queryParameters
          ? _value._queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$RequestEntryImpl extends _RequestEntry {
  const _$RequestEntryImpl(this.path,
      {this.body,
      final Map<String, String>? customHeaders,
      final Map<String, dynamic>? queryParameters})
      : _customHeaders = customHeaders,
        _queryParameters = queryParameters,
        super._();

  @override
  final Path path;
//   String? token,
  @override
  final Object? body;
  final Map<String, String>? _customHeaders;
  @override
  Map<String, String>? get customHeaders {
    final value = _customHeaders;
    if (value == null) return null;
    if (_customHeaders is EqualUnmodifiableMapView) return _customHeaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _queryParameters;
  @override
  Map<String, dynamic>? get queryParameters {
    final value = _queryParameters;
    if (value == null) return null;
    if (_queryParameters is EqualUnmodifiableMapView) return _queryParameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'RequestEntry(path: $path, body: $body, customHeaders: $customHeaders, queryParameters: $queryParameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestEntryImpl &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality()
                .equals(other._customHeaders, _customHeaders) &&
            const DeepCollectionEquality()
                .equals(other._queryParameters, _queryParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      path,
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(_customHeaders),
      const DeepCollectionEquality().hash(_queryParameters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestEntryImplCopyWith<_$RequestEntryImpl> get copyWith =>
      __$$RequestEntryImplCopyWithImpl<_$RequestEntryImpl>(this, _$identity);
}

abstract class _RequestEntry extends RequestEntry {
  const factory _RequestEntry(final Path path,
      {final Object? body,
      final Map<String, String>? customHeaders,
      final Map<String, dynamic>? queryParameters}) = _$RequestEntryImpl;
  const _RequestEntry._() : super._();

  @override
  Path get path;
  @override //   String? token,
  Object? get body;
  @override
  Map<String, String>? get customHeaders;
  @override
  Map<String, dynamic>? get queryParameters;
  @override
  @JsonKey(ignore: true)
  _$$RequestEntryImplCopyWith<_$RequestEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
