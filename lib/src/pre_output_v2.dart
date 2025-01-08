part of 'rest_custom_client.dart';

/// Representa un formato de salida preconfigurado para las respuestas HTTP, proporcionando
/// varios métodos para decodificar la respuesta en diferentes tipos.
///
/// Esta clase permite una decodificación flexible de las respuestas HTTP al aplicar
/// diferentes transformaciones y extrayendo campos específicos si es necesario.
///
/// ### Ejemplos
///
/// ```dart
/// final preOutput = PreOutputV2<F>(response, formatResponse);
///
/// // Decodifica la respuesta e ignora el cuerpo.
/// final result = await preOutput.asVoid();
///
/// // Decodifica la respuesta como una lista de objetos JSON, especificando opcionalmente
/// // un campo para extraer de la respuesta.
/// final output = await preOutput.asListMap('items');
///
/// // Decodifica la respuesta utilizando una función de conversión personalizada.
/// final output = await preOutput.asCustomType<MyType, JsonType>((json) => MyType.fromJson(json));
///
/// // Decodifica la respuesta utilizando la función de formato predeterminada.
/// final output = await preOutput.asDefaultFormat();
///
/// // Decodifica la respuesta como un mapa JSON, especificando opcionalmente un campo
/// // para extraer de la respuesta.
/// final output = await preOutput.asJsonMap('data.items.1');
/// ```

class PreOutputV2<F> {
  PreOutputV2._(this._response, this._formatResponse);

  final F Function(Json) _formatResponse;
  final Future<Response<dynamic>> Function() _response;

  /// Ejecuta la solicitud y devuelve un [RequestOutputV2<Unit>], indicando que
  /// el cuerpo de la respuesta es ignorado.
  ///
  /// Este método es útil cuando el cuerpo de la respuesta no es necesario y solo
  /// el estado de la solicitud es importante, como en las solicitudes DELETE o PUT.
  /// Decodifica la respuesta en un [RequestOutputV2<Unit>], donde `Unit` significa
  /// que el cuerpo de la respuesta no se procesa.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// final output = await preRequest.asVoid();
  /// // El cuerpo de la respuesta es ignorado, y solo se verifica el estado de la solicitud.
  /// ```
  Future<RequestOutputV2<Unit>> asVoid() => _decode(convert: (_) => const Success(unit));

  /// Decodifica la respuesta en un [RequestOutputV2<Map<String, dynamic>>],
  /// interpretando la respuesta como un mapa JSON.
  ///
  /// Se puede proporcionar un [specificField] opcional para extraer un campo específico
  /// de la respuesta JSON. El [specificField] debe ser una ruta separada por puntos
  /// que representa el campo que deseas acceder dentro de la estructura JSON.
  /// Por ejemplo, un valor de 'data.items' extraería el campo 'items'
  /// anidado dentro del campo 'data' de la respuesta JSON.
  ///
  /// Para estructuras profundas, utiliza la notación de puntos con índices numéricos (por ejemplo,
  /// 'field.0.subfield') para navegar hacia los datos deseados. La función manejará tanto
  /// campos anidados como listas interpretando los índices correctamente.
  ///
  /// Ejemplo de uso:
  ///
  /// Supongamos que la respuesta JSON es:
  /// ```json
  /// {
  ///   "data": {
  ///     "items": [
  ///       {"id": 1, "name": "Item 1"},
  ///       {"id": 2, "name": "Item 2"},
  ///       {"id": 3, "name": "Item 3", "detail": {"info": "Info Detail 3"}}
  ///     ],
  ///     "info": "Some info"
  ///   },
  ///   "status": "success"
  /// }
  /// ```
  ///
  /// - Para extraer el campo `data` de la respuesta JSON:
  /// ```dart
  /// final output = await preRequest.asJsonMap('data');
  /// // La salida será: {
  /// //   "items": [
  /// //     {"id": 1, "name": "Item 1"},
  /// //     {"id": 2, "name": "Item 2"},
  /// //     {"id": 3, "name": "Item 3", "detail": {"info": "Info Detail 3"}}
  /// //   ],
  /// //   "info": "Some info"
  /// // }
  /// ```
  ///
  /// - Para extraer el campo `detail` del tercer ítem en la lista de `items`:
  /// ```dart
  /// final output = await preRequest.asJsonMap('data.items.2.detail');
  /// // La salida será: {"info": "Info Detail 3"}
  /// ```
  ///
  /// - Para devolver toda la respuesta JSON tal como está:
  /// ```dart
  /// final output = await preRequest.asJsonMap();
  /// // La salida será: {
  /// //   "data": {
  /// //     "items": [
  /// //       {"id": 1, "name": "Item 1"},
  /// //       {"id": 2, "name": "Item 2"},
  /// //       {"id": 3, "name": "Item 3", "detail": {"info": "Info Detail 3"}}
  /// //     ],
  /// //     "info": "Some info"
  /// //   },
  /// //   "status": "success"
  /// // }
  /// ```
  ///
  /// Si el campo especificado no existe o no es del tipo esperado,
  /// se lanzará una excepción.
  Future<RequestOutputV2<Map<String, dynamic>>> asJsonMap([String? specificField]) {
    return _decode(
      specificField: specificField,
      convert: Success.new,
    );
  }

  /// Decodifica la respuesta en un [RequestOutputV2<List<Map<String, dynamic>>>],
  /// interpretando la respuesta como una lista de mapas.
  ///
  /// Se puede proporcionar un [specificField] opcional para extraer un campo específico
  /// de la respuesta JSON. El [specificField] debe ser una ruta separada por puntos
  /// que representa el campo que deseas acceder dentro de la estructura JSON.
  /// Por ejemplo, un valor de 'items' extraería el campo 'items' de la
  /// respuesta JSON.
  ///
  /// Si el campo está anidado, utiliza la notación de puntos (por ejemplo, 'field.subfield' o
  /// 'field.0.subfield') para especificar la ruta a los datos deseados.
  ///
  /// Ejemplo de uso:
  ///
  /// Supongamos que la respuesta JSON es:
  /// ```json
  /// {
  ///   "data": {
  ///     "items": [
  ///       {"id": 1, "name": "Item 1"},
  ///       {"id": 2, "name": "Item 2"},
  ///       {"id": 3, "values": [{"key": "value1"}, {"key": "value2"}]}
  ///     ],
  ///     "info": "Some info"
  ///   },
  ///   "status": "success"
  /// }
  /// ```
  ///
  /// - Para extraer la lista de `items` de la respuesta JSON:
  /// ```dart
  /// final output = await preRequest.asListMap('data.items');
  /// // La salida será: [
  /// //   {"id": 1, "name": "Item 1"},
  /// //   {"id": 2, "name": "Item 2"},
  /// //   {"id": 3, "values": [{"key": "value1"}, {"key": "value2"}]}
  /// // ]
  /// ```
  ///
  /// - Para extraer el campo `values` del tercer ítem en la lista de `items`:
  /// ```dart
  /// final output = await preRequest.asListMap('data.items.2.values');
  /// // La salida será: [
  /// //   {"key": "value1"},
  /// //   {"key": "value2"}
  /// // ]
  /// ```
  ///
  /// - Para extraer el campo `values` del primer ítem en la lista de `items`:
  /// ```dart
  /// final output = await preRequest.asListMap('data.items.0.values');
  /// // La salida será: [] // Si no hay valores para el primer ítem, la salida será una lista vacía
  /// ```
  ///
  /// Si el campo especificado no existe o no es una lista de mapas,
  /// se lanzará una excepción.

  Future<RequestOutputV2<List<Map<String, dynamic>>>> asListMap([String? specificField]) => _decode(
        specificField: specificField,
        convert: RequestOutputV2.successListJson,
      );

  /// Decodifica la respuesta en un [RequestOutputV2<C>] utilizando una
  /// función de conversión personalizada [convert] para transformar los datos de la respuesta.
  ///
  /// La función [convert] debe tomar un [D] y devolver un [C]. Este método es
  /// útil para casos en los que la respuesta necesita ser mapeada a un tipo de
  /// dato personalizado. La función de conversión se aplicará a los datos
  /// decodificados de la respuesta para producir el resultado final.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// final output = await preRequest.asCustomType<int, double>((double code) => code.toInt());
  /// // La respuesta será decodificada y transformada usando la función
  /// // [convert] proporcionada para producir un [RequestOutputV2<int>].
  /// ```
  ///
  /// ```dart
  /// final output = await preRequest.asCustomType(MyCustomType.fromJson);
  /// // La respuesta será decodificada y transformada usando la función
  /// // [convert] proporcionada para producir un [RequestOutputV2<MyCustomType>].
  /// ```

  Future<RequestOutputV2<C>> asCustomType<C, D>(C Function(D) convert) =>
      _decode<C, D>(convert: (type) => Success(convert(type)));

  /// Decodifica la respuesta en un [RequestOutputV2<F>] utilizando la
  /// función de formato predeterminada proporcionada durante la creación de [RestCustomClient].
  ///
  /// Este método es útil para casos en los que la respuesta debe ser
  /// interpretada usando la función de formato predeterminada especificada
  /// al crear la instancia de [RestCustomClient]. La respuesta será
  /// decodificada según la función de formato predeterminada.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// final output = await preRequest.asDefaultFormat();
  /// // La respuesta será decodificada utilizando la función de formato
  /// // predeterminada proporcionada al crear el [RestCustomClient].
  /// ```

  Future<RequestOutputV2<F>> asDefaultFormat() => _decode(isDefaultFormat: true, convert: Success.new);

  /// Internal method to handle decoding of the response, using the provided
  /// [convert] function to transform the response into the desired output type [O].
  ///
  /// If [isDefaultFormat] is true, the custom format function [_formatResponse]
  /// will be applied to the response. Otherwise, the response is processed
  /// directly.
  ///
  /// An optional [specificField] can be provided to extract a specific field
  /// from the response before converting it. The field can represent deep
  /// structures, using dot notation (e.g., 'field.subfield', 'field.0.subfield').
  Future<RequestOutputV2<O>> _decode<O, D>({
    required RequestOutputV2<O> Function(D) convert,
    String? specificField,
    bool isDefaultFormat = false,
  }) async {
    try {
      final response = (await _response()).decodeBody();

      return response.map((response) {
        if (isDefaultFormat) {
          return _formatResponse(response as Json) as D;
        }

        return specificField == null ? response as D : unwrapSpecificField<D>(response, specificField);
      }).fold(RequestOutputV2.failure, convert);
    } catch (err, st) {
      return RequestOutputV2.exception(err, st);
    }
  }
}
