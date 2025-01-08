part of 'rest_custom_client.dart';

extension StatusCode on Response<dynamic> {
  bool get isRedirectError => statusCode! >= 300 && statusCode! < 400;

  bool get isClientError => statusCode! >= 400 && statusCode! < 500;

  bool get isServerError => statusCode! >= 500 && statusCode! < 600;

  bool get isOtherError => statusCode! < 200 || statusCode! >= 300;

  Either<StatusCodeFailure, dynamic> decodeBody() {
    final dataDecode = data.toString().isEmpty ? <dynamic>{} : data;

    _mapToThrowException();

    if (isRedirectError) {
      return Left(StatusCodeFailure.errors300(statusCode!, data));
    }

    if (isClientError) {
      return Left(StatusCodeFailure.errors400(statusCode!, data));
    }

    if (isServerError) {
      return Left(StatusCodeFailure.errors500(statusCode!, data));
    }

    if (isOtherError) return Left(StatusCodeFailure.other(statusCode!, data));

    return right(dataDecode);
  }

  void _mapToThrowException() {
    if (statusCode != null) return;

    if (data == null) throw Exception(requestOptions);

    if (data is SocketException) {
      throw data as SocketException;
    }

    if (data is! DioException) {
      if (data.toString().contains('connectTimeout')) {
        throw TimeoutException(data.toString());
      }
      throw Exception(data);
    }

    final dioError = data as DioException;

    final mapError = <DioExceptionType, Exception>{
      DioExceptionType.connectionError:
          SocketException(dioError.message.toString()),
      DioExceptionType.connectionTimeout:
          SocketException(dioError.message.toString()),
      DioExceptionType.sendTimeout:
          TimeoutException(dioError.message.toString()),
      DioExceptionType.receiveTimeout:
          TimeoutException(dioError.message.toString()),
    };

    final exception = mapError[dioError.type] ?? Exception(dioError.message);

    throw exception;
  }
}
