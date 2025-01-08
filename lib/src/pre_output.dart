part of 'rest_custom_client.dart';

class PreOutput<F> {
  PreOutput._(this._response, this._myRequestFormat);

  final F Function(Json) _myRequestFormat;
  final Future<Response<dynamic>> _response;

  Future<RequestOutput<Unit>> asNone() async => (await _decode<Json>())
      .fold(RequestOutput.error, (r) => const SuccessData<Unit>(unit));

  Future<RequestOutput<Json>> asMap([String? specificField]) async =>
      (await _decode<Json>(specificField: specificField))
          .fold(RequestOutput.error, SuccessData<Json>.new);

  Future<RequestOutput<ListJson>> asListMap([String? specificField]) async =>
      (await _decode<dynamic>(specificField: specificField))
          .fold(RequestOutput.error, RequestOutput.succesListJson);

  Future<RequestOutput<C>> asCustom<C, D>(C Function(D) convert) async =>
      (await _decode<D>())
          .fold(RequestOutput.error, (json) => SuccessData<C>(convert(json)));

  Future<RequestOutput<F>> asFormatDefault() async =>
      (await _decode<F>(isCustom: true))
          .fold(RequestOutput.error, SuccessData<F>.new);

  Future<Either<StatusCodeFailure, D>> _decode<D>(
      {String? specificField, bool isCustom = false}) async {
    final response = (await _response).decodeBody();

    return response.map((response) {
      if (isCustom) return _myRequestFormat(response as Json) as D;

      return specificField == null
          ? response as D
          : unwrapSpecificField<D>(response, specificField);
    });
  }
}
