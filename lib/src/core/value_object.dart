import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:regexpattern/regexpattern.dart';

class Domain {
  final Either<String, String> value;

  factory Domain(String input, {bool isLocal = false}) {
    return Domain._(input.isUrl() || isLocal ? right(input) : left(input));
  }
  const Domain._(this.value);

  String getOrCrash() => value.fold(
        (l) => throw ArgumentError('Invalid domain: $l'),
        (r) => r,
      );
}

class Path {
  final Either<String, String> value;

  static const pathRegex = r'^\/?([\w-]*\/)*[\w-]*\/?$';

  /// Example:
  ///
  ///      Path('/api/v3')
  ///      Path('/api/v3').add('/users')  // ->  Path( '/api/v3/users' )
  ///
  factory Path(String input) {
    if (RegExp(pathRegex).hasMatch(input)) return Path._(right(input));

    return Path._(left(input));
  }
  const Path._(this.value);

  /// Example
  ///
  ///      Path('/api/v3').add('users')  // ->  Path( '/api/v3/users' )
  ///      Path('/api/v3').add('/users')  // ->  Path( '/api/v3/users' )
  ///
  Path add(String morePath) =>
      Path(join(getOrCrash(), morePath[0] == '/' ? morePath.replaceFirst(RegExp('/'), '') : morePath));

  String getOrCrash() => value.fold((l) => throw ArgumentError('Invalid Path: $l'), (r) => r);
}
