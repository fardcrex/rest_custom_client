// 🎯 Dart imports:
// import 'dart:_http';
import 'dart:io';

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rest_custom_client/src/core/value_object.dart';

part 'request_entry.freezed.dart';

@freezed
class RequestEntry with _$RequestEntry {
  const factory RequestEntry(
    Path path, {
    //   String? token,
    Object? body,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) = _RequestEntry;

  const RequestEntry._();

  Map<String, String> get headers {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      if (customHeaders != null) ...customHeaders!,
      //   if (token != null) HttpHeaders.authorizationHeader: '$token'
    };
  }

  //String? get bodyEncode => body. != null ? jsonEncode(body) : null;
}
