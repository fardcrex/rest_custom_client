// Dart imports:
import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
// Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rest_custom_client/src/core/status_code_failures.dart';
import 'package:rest_custom_client/src/core/utils.dart';
import 'package:rest_custom_client/src/core/value_object.dart';
import 'package:rest_custom_client/src/interceptors/interceptor_bad_response.dart';
import 'package:rest_custom_client/src/request_entry/request_entry.dart';
import 'package:rest_custom_client/src/request_output/request_output.dart';

// Exported packages and modules:
export 'package:dio/dio.dart' show BaseOptions;
export 'package:path/path.dart';

export 'request_entry/request_entry.dart';
export 'request_output/request_output.dart';

// Part files:
part 'pre_output.dart';
part 'pre_output_v2.dart';
part 'status_code_extension.dart';

/// Un cliente HTTP personalizado para realizar solicitudes con configuración avanzada y registro.
///
/// La clase [RestCustomClient] extiende las capacidades de Dio, permitiendo realizar solicitudes HTTP
/// personalizadas con manejo de errores, registro, y formateo flexible de respuestas.
/// Este cliente soporta varios tipos de solicitudes (GET, POST, PUT, DELETE) y permite
/// la integración de interceptores para la modificación de solicitudes y manejo de errores.
///
/// ### Uso
///
/// ```dart
/// final client = RestCustomClient.withCustomFormat(
///   (json) => json,
///   options: BaseOptions(baseUrl: 'https://api.example.com'),
///   isDebugMode: true,
/// );
///
/// final result = await client.preRequestGET(() => RequestEntry(
///   path: Path('/endpoint'),
///   queryParameters: {'key': 'value'},
/// )).asJsonMap();
/// ```
///
/// ### Parámetros
/// - **F**: El tipo al cual se transformará la respuesta JSON utilizando la función de formato personalizada.
///
/// ### Métodos
/// - **[RestCustomClient.withCustomFormat]**: Crea una nueva instancia del cliente con un formato de respuesta personalizado.
/// - **[addInterceptor]**: Añade interceptores a la instancia de Dio para el manejo personalizado de solicitudes/respuestas.
/// - **[buildUri]**: Construye un URI a partir de un objeto [RequestEntry].
/// - **[preRequestGET]**: Prepara una solicitud GET, devolviendo un objeto [PreOutputV2] para el manejo flexible de la respuesta.
/// - **[preRequestPUT]**: Prepara una solicitud PUT, devolviendo un objeto [PreOutputV2].
/// - **[preRequestPOST]**: Prepara una solicitud POST, devolviendo un objeto [PreOutputV2].
/// - **[preRequestDELETE]**: Prepara una solicitud DELETE, devolviendo un objeto [PreOutputV2].
///
/// ### Ejemplo
///
/// ```dart
/// final client = RestCustomClient.withCustomFormat(
///   (json) => MyCustomType.fromJson(json),
///   options: BaseOptions(baseUrl: 'https://api.example.com'),
///   isDebugMode: true,
/// );
///
/// final preOutput = client.preRequestGET(() => RequestEntry(
///   path: Path('/endpoint'),
///   queryParameters: {'key': 'value'},
/// ));
///
/// // Ejecuta la solicitud y analiza la respuesta
/// final output = await preOutput.asDefaultFormat();
/// ```

class RestCustomClient<F> {
  /// Crea una instancia de [RestCustomClient] con un formato de solicitud personalizado.
  ///
  /// - [myRequestFormat]: Una función para formatear la respuesta JSON en el tipo [F].
  /// - [options]: [BaseOptions] opcionales para la configuración de Dio.
  /// - [buildInterceptor]: Función opcional para construir interceptores personalizados.
  /// - [isUriLocal]: Indicador de si la URL base es local.
  /// - [isDebugMode]: Indicador de si el modo de depuración está habilitado (para el registro).
  /// - [showResponseBody]: Indicador de si el cuerpo de la respuesta debe mostrarse en los registros.
  RestCustomClient.withCustomFormat(
    this._myRequestFormat, {
    BaseOptions? options,
    this.buildInterceptor,
    bool isUriLocal = false,
    this.isDebugMode = false,
    this.showResponseBody = false,
  }) : dioInstance = Dio(options?.copyWith(baseUrl: Domain(options.baseUrl, isLocal: isUriLocal).getOrCrash())) {
    addInterceptor();
  }

  /// Crea un [RestCustomClient] predeterminado con formato de solicitud JSON.
  ///
  /// - [options]: [BaseOptions] opcionales para la configuración de Dio.
  /// - [isDebugMode]: Indicador de si el modo de depuración está habilitado (para el registro).
  static RestCustomClient<Json> mapByDefault({
    BaseOptions? options,
    bool isDebugMode = false,
  }) =>
      RestCustomClient.withCustomFormat(
        (json) => json,
        options: options,
        isDebugMode: isDebugMode,
        showResponseBody: isDebugMode,
      );

  final F Function(Json) _myRequestFormat;
  final Dio dioInstance;
  final bool isDebugMode;
  final bool showResponseBody;
  final Interceptor Function(Dio dio)? buildInterceptor;

  /// Añade interceptores a la instancia de Dio para manejo personalizado y registro.
  void addInterceptor() {
    if (buildInterceptor != null) {
      dioInstance.interceptors.add(buildInterceptor!.call(dioInstance));
    }
    dioInstance.interceptors.add(interceptorBadResponse);

    if (isDebugMode) {
      dioInstance.interceptors.add(PrettyDioLogger(
        responseBody: showResponseBody,
        requestBody: showResponseBody,
      ));
    }
  }

  /// Construye un URI para un [RequestEntry] dado.
  ///
  /// - [request]: El [RequestEntry] que contiene la ruta y los parámetros de consulta.
  ///
  /// Devuelve un [Uri] construido a partir de la URL base y los detalles de la solicitud.
  Uri buildUri(RequestEntry request) {
    final baseUrl = dioInstance.options.baseUrl;

    final uriParse = baseUrl.contains('http') ? Uri.parse(baseUrl) : Uri.parse('https://$baseUrl');

    final pathString = Path(uriParse.path).add(request.path.getOrCrash()).getOrCrash();

    return uriParse.scheme.contains('https')
        ? Uri.https(uriParse.host, pathString, request.queryParameters)
        : Uri.http(uriParse.host, pathString, request.queryParameters);
  }

  /// @Deprecated('Usar preRequestGET en su lugar para mayor flexibilidad y manejo de errores.')
  @Deprecated('Usar preRequestGET en su lugar para mayor flexibilidad y manejo de errores.')
  PreOutput<F> getPreRequest(RequestEntry request) {
    final uri = buildUri(request);

    final response = dioInstance.getUri<dynamic>(uri, options: Options(headers: request.headers));

    return PreOutput<F>._(response, _myRequestFormat);
  }

  /// @Deprecated('Usar preRequestPOST en su lugar para mayor flexibilidad y manejo de errores.')
  @Deprecated('Usar preRequestPOST en su lugar para mayor flexibilidad y manejo de errores.')
  PreOutput<F> postPreRequest(RequestEntry request) {
    final uri = buildUri(request);

    final response = dioInstance.postUri<dynamic>(uri, data: request.body, options: Options(headers: request.headers));

    return PreOutput<F>._(response, _myRequestFormat);
  }

  /// @Deprecated('Usar preRequestPUT en su lugar para mayor flexibilidad y manejo de errores.')
  @Deprecated('Usar preRequestPUT en su lugar para mayor flexibilidad y manejo de errores.')
  PreOutput<F> putPreRequest(RequestEntry request) {
    final uri = buildUri(request);

    final response = dioInstance.putUri<dynamic>(uri, data: request.body, options: Options(headers: request.headers));

    return PreOutput<F>._(response, _myRequestFormat);
  }

  /// @Deprecated('Usar preRequestDELETE en su lugar para mayor flexibilidad y manejo de errores.')
  @Deprecated('Usar preRequestDELETE en su lugar para mayor flexibilidad y manejo de errores.')
  PreOutput<F> deletePreRequest(RequestEntry request) {
    final uri = buildUri(request);

    final response =
        dioInstance.deleteUri<dynamic>(uri, data: request.body, options: Options(headers: request.headers));

    return PreOutput<F>._(response, _myRequestFormat);
  }

  /// Prepara una solicitud GET utilizando una función generadora de [RequestEntry].
  ///
  /// - [entryBuilder]: Una función que devuelve un [RequestEntry] con la ruta y los parámetros de consulta.
  ///
  /// Devuelve una instancia de [PreOutputV2] para la solicitud GET.
  PreOutputV2<F> preRequestGET(RequestEntry Function() entryBuilder) {
    return PreOutputV2<F>._(() {
      final entry = entryBuilder();
      return dioInstance.getUri<dynamic>(
        buildUri(entry),
        options: Options(headers: entry.headers),
      );
    }, _myRequestFormat);
  }

  /// Prepara una solicitud PUT utilizando una función generadora de [RequestEntry].
  ///
  /// - [entryBuilder]: Una función que devuelve un [RequestEntry] con la ruta, el cuerpo y los encabezados.
  ///
  /// Devuelve una instancia de [PreOutputV2] para la solicitud PUT.
  PreOutputV2<F> preRequestPUT(RequestEntry Function() entryBuilder) {
    return PreOutputV2<F>._(() {
      final entry = entryBuilder();
      return dioInstance.putUri<dynamic>(
        buildUri(entry),
        data: entry.body,
        options: Options(headers: entry.headers),
      );
    }, _myRequestFormat);
  }

  /// Prepara una solicitud POST utilizando una función generadora de [RequestEntry].
  ///
  /// - [entryBuilder]: Una función que devuelve un [RequestEntry] con la ruta, el cuerpo y los encabezados.
  ///
  /// Devuelve una instancia de [PreOutputV2] para la solicitud POST.
  PreOutputV2<F> preRequestPOST(RequestEntry Function() entryBuilder) {
    return PreOutputV2<F>._(() {
      final entry = entryBuilder();
      return dioInstance.postUri<dynamic>(
        buildUri(entry),
        data: entry.body,
        options: Options(headers: entry.headers),
      );
    }, _myRequestFormat);
  }

  /// Prepara una solicitud DELETE utilizando una función generadora de [RequestEntry].
  ///
  /// - [entryBuilder]: Una función que devuelve un [RequestEntry] con la ruta, el cuerpo y los encabezados.
  ///
  /// Devuelve una instancia de [PreOutputV2] para la solicitud DELETE.
  PreOutputV2<F> preRequestDELETE(RequestEntry Function() entryBuilder) {
    return PreOutputV2<F>._(() {
      final entry = entryBuilder();
      return dioInstance.deleteUri<dynamic>(
        buildUri(entry),
        data: entry.body,
        options: Options(headers: entry.headers),
      );
    }, _myRequestFormat);
  }
}
