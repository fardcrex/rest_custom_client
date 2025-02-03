import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_code_failures.freezed.dart';

@freezed
class StatusCodeFailure with _$StatusCodeFailure {
  const factory StatusCodeFailure(int statusCode, dynamic data, dynamic extra) =
      _StatusCodeFailure;

  factory StatusCodeFailure.mock([dynamic data]) =>
      StatusCodeFailure(-1, data ?? 'Mock', '');
}
