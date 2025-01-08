/* // Dart imports:
import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mercadito_app/features/shared/infraestructure/http_custom_instance/request_entry/request_entry.dart';
import 'package:mercadito_app/features/shared/infraestructure/http_custom_instance/request_output/request_output.dart';
import 'package:mercadito_app/features/shared/infraestructure/http_custom_instance/status_code_failures.dart';

export 'package:path/path.dart';

export 'request_entry/request_entry.dart';
export 'request_output/request_output.dart';

class HttpClientCustom<F> {
  const HttpClientCustom.withMiOwnFormat(this._myRequestFormat);

  static final HttpClientCustom<Json> mapByDefault = HttpClientCustom.withMiOwnFormat((json) => json);

  final F Function(Json) _myRequestFormat;

  PreOutput<F> getPreRequest(RequestEntry request) {
    final response = http.get(request.getUri(), headers: request.headers);

    return PreOutput<F>._(response, _myRequestFormat);
  }

  PreOutput<F> putPreRequest(RequestEntry request) {
    final response = http.put(request.getUri(), body: request.bodyEncode, headers: request.headers);

    return PreOutput<F>._(response, _myRequestFormat);
  }

  PreOutput<F> deletePreRequest(RequestEntry request) {
    final response = http.delete(request.getUri(), body: request.bodyEncode, headers: request.headers);

    return PreOutput<F>._(response, _myRequestFormat);
  }

  PreOutput<F> postPreRequest(RequestEntry request) {
    final response = http.post(request.getUri(), body: request.bodyEncode, headers: request.headers);

    return PreOutput<F>._(response, _myRequestFormat);
  }
}

class PreOutput<F> {
  PreOutput._(this._response, this._myRequestFormat);

  final F Function(Json) _myRequestFormat;
  final Future<http.Response> _response;

  Future<RequestOutput<Unit>> asNone() async =>
      (await _decode<Json>(null)).fold(RequestOutput.error, (r) => const Success<Unit>(unit));

  Future<RequestOutput<Json>> asMap([String? specificField]) async =>
      (await _decode<Json>(specificField)).fold(RequestOutput.error, Success<Json>.new);

  Future<RequestOutput<ListJson>> asListMap([String? specificField]) async =>
      (await _decode<dynamic>(specificField)).fold(RequestOutput.error, RequestOutput.succesListJson);

  Future<RequestOutput<C>> asCustom<C>(C Function(Json) convert) async =>
      (await _decode<Json>(null)).fold(RequestOutput.error, (json) => Success<C>(convert(json)));

  Future<RequestOutput<F>> asMyOwnFormat() async =>
      (await _decode<F>(null, isCustom: true)).fold(RequestOutput.error, Success<F>.new);

  Future<Either<StatusCodeFailure, D>> _decode<D>(String? specificField, {bool isCustom = false}) async {
    final response = (await _response).decodeBody();

    return response.map((response) {
      if (isCustom) return _myRequestFormat(response as Json) as D;

      if (specificField == null) return response as D;

      return (response as Json)[specificField] as D;
    });
  }
}

extension StatusCode on http.Response {
  bool get isClientError => statusCode >= 400 && statusCode < 500;

  bool get isServerError => statusCode >= 500 && statusCode < 600;

  bool get isOtherError => statusCode < 200 || statusCode >= 300;

  Either<StatusCodeFailure, dynamic> decodeBody() {
    final data = body.isEmpty ? <dynamic>[] : jsonDecode(body);

    if (isClientError) return Left(StatusCodeFailure.errors400(statusCode, data));

    if (isServerError) return Left(StatusCodeFailure.errors500(statusCode, data));

    if (isOtherError) return Left(StatusCodeFailure.other(statusCode, data));

    return right(data);
  }
}
 */
