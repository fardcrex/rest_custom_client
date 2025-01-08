import 'package:dio/dio.dart';

final interceptorBadResponse = InterceptorsWrapper(
  onError: (err, handler) {
    final response = err.response;
    if (response == null) {
      return handler.resolve(Response(
        requestOptions: err.requestOptions,
        data: err.error ?? err.message,
      ));
    }
    if (err.type == DioExceptionType.badResponse) {
      response.data ??= err.message;

      return handler.resolve(response);
    }

    return handler.reject(err);
    //continue
  },
);
