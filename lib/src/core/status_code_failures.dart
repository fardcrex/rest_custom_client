import 'package:freezed_annotation/freezed_annotation.dart';
part 'status_code_failures.freezed.dart';

@freezed
class StatusCodeFailure with _$StatusCodeFailure {
  const factory StatusCodeFailure.errors500(int statusCode, dynamic data) =
      Errors500;
  const factory StatusCodeFailure.errors400(int statusCode, dynamic data) =
      Errors400;
  const factory StatusCodeFailure.errors300(int statusCode, dynamic data) =
      Errors300;
  const factory StatusCodeFailure.other(int statusCode, dynamic data) = Unknow;

  factory StatusCodeFailure.mock([dynamic data]) =>
      StatusCodeFailure.other(-1, data ?? 'Mock');
}
