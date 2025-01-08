sealed class FieldUnwrapException implements Exception {
  const FieldUnwrapException(this.message);
  final String message;

  @override
  String toString() => message;
}

class FieldNotFoundException extends FieldUnwrapException {
  const FieldNotFoundException(String field)
      : super('Field not found or is not a JSON object: $field');
}

class IndexOutOfBoundsException extends FieldUnwrapException {
  const IndexOutOfBoundsException(int index, String field)
      : super('Index out of bounds: $index at field: $field');
}

class NullValueException extends FieldUnwrapException {
  const NullValueException(String field)
      : super('Null value encountered at field: $field');
}

class TypeMismatchException<D> extends FieldUnwrapException {
  const TypeMismatchException(Type expected, Type actual)
      : super('Type mismatch: expected $expected, but got $actual');
}
