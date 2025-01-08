import 'package:rest_custom_client/src/core/exceptions.dart';

/// Desenvuelve un campo específico de una respuesta dinámica usando una notación de punto.
///
/// La notación de punto puede incluir índices para acceder a elementos dentro de listas.
///
/// Throws:
/// - [FieldNotFoundException] si el campo no se encuentra.
/// - [IndexOutOfBoundsException] si se intenta acceder a un índice fuera del rango.
/// - [NullValueException] si se encuentra un valor nulo en el camino.
/// - [TypeMismatchException] si el tipo del valor no coincide con el tipo esperado.
D unwrapSpecificField<D>(dynamic response, String specificField) {
  final fields = specificField.split('.');
  dynamic unwrappedValue = response;

  for (var i = 0; i < fields.length - 1; i++) {
    final field = fields[i];
    unwrappedValue = _accessField(unwrappedValue, field);
  }

  // Verificamos el último campo
  final lastField = fields.last;
  return _getLastField<D>(unwrappedValue, lastField);
}

/// Accede a un campo específico en un mapa o lista.
///
/// Throws:
/// - [FieldNotFoundException] si el campo no se encuentra.
/// - [IndexOutOfBoundsException] si se intenta acceder a un índice fuera del rango.
dynamic _accessField(dynamic value, String field) {
  if (_isNumeric(field)) {
    final index = int.parse(field);
    if (value is List) {
      if (index < value.length) {
        return value[index];
      } else {
        throw IndexOutOfBoundsException(index, field);
      }
    } else {
      throw FieldNotFoundException(field);
    }
  } else if (value is Map<String, dynamic> && value.containsKey(field)) {
    return value[field];
  } else {
    throw FieldNotFoundException(field);
  }
}

/// Verifica si una cadena representa un número.
///
/// Esto se usa para determinar si se debe acceder a un índice en una lista.
bool _isNumeric(String str) => RegExp(r'^\d+$').hasMatch(str);

/// Verifica el último campo y lanza una excepción si el valor no coincide con el tipo esperado.
///
/// Throws:
/// - [NullValueException] si el valor es nulo.
/// - [TypeMismatchException] si el valor no es del tipo esperado.
/// - [FieldNotFoundException] si el campo no se encuentra.
D _getLastField<D>(dynamic value, String lastField) {
  if (_isNumeric(lastField)) {
    final index = int.parse(lastField);
    if (value is List) {
      if (index < value.length) {
        final finalValue = value[index];
        return _validateValue<D>(finalValue, lastField);
      } else {
        throw IndexOutOfBoundsException(index, lastField);
      }
    } else {
      throw FieldNotFoundException(lastField);
    }
  } else if (value is Map<String, dynamic> && value.containsKey(lastField)) {
    final finalValue = value[lastField];
    return _validateValue<D>(finalValue, lastField);
  } else {
    throw FieldNotFoundException(lastField);
  }
}

/// Valida el valor obtenido para asegurarse de que no sea nulo y que sea del tipo esperado.
///
/// Throws:
/// - [NullValueException] si el valor es nulo.
/// - [TypeMismatchException] si el valor no es del tipo esperado.
D _validateValue<D>(dynamic value, String field) {
  if (value == null) {
    throw NullValueException(field);
  }
  if (value is D) {
    return value;
  } else {
    throw TypeMismatchException<D>(D, value.runtimeType);
  }
}
