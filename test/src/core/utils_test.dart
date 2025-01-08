import 'package:rest_custom_client/src/core/exceptions.dart';
import 'package:rest_custom_client/src/core/utils.dart';
import 'package:test/test.dart';
// Actualiza este import con la ruta real de tu archivo

void main() {
  group('unwrapSpecificField', () {
    test('Desenvuelve un campo anidado en un mapa con éxito', () {
      final response = {
        'data': {
          'user': {
            'name': 'John Doe',
          },
        }
      };

      final result = unwrapSpecificField<String>(response, 'data.user.name');
      expect(result, equals('John Doe'));
    });

    test('Desenvuelve un elemento dentro de una lista', () {
      final response = {
        'data': {
          'items': ['Item1', 'Item2', 'Item3'],
        },
      };

      final result = unwrapSpecificField<String>(response, 'data.items.1');
      expect(result, equals('Item2'));
    });

    test('Lanza FieldNotFoundException si el campo no existe en un mapa', () {
      final response = {
        'data': {
          'user': {
            'name': 'John Doe',
          },
        },
      };

      expect(
        () => unwrapSpecificField<String>(response, 'data.user.age'),
        throwsA(isA<FieldNotFoundException>()),
      );
    });

    test('Lanza IndexOutOfBoundsException si el índice está fuera de rango', () {
      final response = {
        'data': {
          'items': ['Item1', 'Item2', 'Item3'],
        },
      };

      expect(
        () => unwrapSpecificField<String>(response, 'data.items.5'),
        throwsA(isA<IndexOutOfBoundsException>()),
      );
    });

    test('Lanza NullValueException si el valor es nulo', () {
      final response = {
        'data': {
          'user': {
            'name': null,
          },
        },
      };

      expect(
        () => unwrapSpecificField<String>(response, 'data.user.name'),
        throwsA(isA<NullValueException>()),
      );
    });

    test('Lanza TypeMismatchException si el tipo del valor no coincide', () {
      final response = {
        'data': {
          'user': {
            'age': 30,
          },
        },
      };

      expect(
        () => unwrapSpecificField<String>(response, 'data.user.age'),
        throwsA(isA<TypeMismatchException<String>>()),
      );
    });

    test('Desenvuelve un valor anidado que es una lista completa', () {
      final response = {
        'data': {
          'user': {
            'activities': ['running', 'swimming'],
          },
        },
      };

      final result = unwrapSpecificField<List<String>>(response, 'data.user.activities');
      expect(result, equals(['running', 'swimming']));
    });

    test('Lanza FieldNotFoundException si el campo no existe en la última posición', () {
      final response = {
        'data': {
          'user': {
            'name': 'John Doe',
          },
        },
      };

      expect(
        () => unwrapSpecificField<String>(response, 'data.user.address.street'),
        throwsA(isA<FieldNotFoundException>()),
      );
    });
  });
}
