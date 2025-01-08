import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rest_custom_client/src/core/status_code_failures.dart';

part 'request_output.freezed.dart';

const String Data = 'data';

typedef Json = Map<String, dynamic>;

typedef ListJson = List<Json>;

@freezed
sealed class RequestOutput<D> with _$RequestOutput<D> {
  const RequestOutput._();

  const factory RequestOutput.success(D data) = SuccessData<D>;

  const factory RequestOutput.error(StatusCodeFailure err) = Error<D>;

  static RequestOutput<ListJson> succesListJson(dynamic data) =>
      SuccessData<ListJson>(ListJson.from(data as Iterable<dynamic>));
}

/// Represents the result of an HTTP request, encapsulating different states
/// such as success, failure, or exception.
///
/// Use this class to handle the outcome of HTTP requests in a type-safe manner.
///
/// ### Examples
///
/// ```dart
/// final output = RequestOutputV2.success(data);
/// final output = RequestOutputV2.failure(failure);
/// final output = RequestOutputV2.exception(err, st);
/// ```
/// A sealed class representing the result of an operation.
/// This class can be in one of the following states:
/// - `Success`: Indicates a successful operation with the provided data.
/// - `OnFailure`: Indicates a failure with a status code failure.
/// - `OnException`: Indicates an exception occurred during the operation.
sealed class RequestOutputV2<D> {
  const RequestOutputV2();

  /// Factory constructor for a successful response.
  ///
  /// Creates an instance of [Success] with the provided [data].
  ///
  /// [data] is the result of a successful operation.
  factory RequestOutputV2.success(D data) = Success<D>;

  /// Factory constructor for a failure response.
  ///
  /// Creates an instance of [OnFailure] with the provided [failure].
  ///
  /// [failure] represents the error details and includes status codes like 400, 500, etc.
  factory RequestOutputV2.failure(StatusCodeFailure failure) = OnFailure<D>;

  /// Factory constructor for an exception response.
  ///
  /// Creates an instance of [OnException] with the provided [err] and [st].
  ///
  /// [err] represents the exception that occurred, and [st] provides the stack trace.
  factory RequestOutputV2.exception(Object err, StackTrace st) = OnException<D>;

  /// Converts a dynamic data source into a [RequestOutputV2<ListJson>].
  ///
  /// This method is used to create a [RequestOutputV2<ListJson>] instance from a dynamic data source.
  /// The [data] parameter is expected to be an [Iterable] which will be converted to [ListJson].
  ///
  /// [data] is a dynamic source that should be an iterable of JSON objects.
  static RequestOutputV2<ListJson> successListJson(dynamic data) =>
      Success<ListJson>(ListJson.from(data as Iterable<dynamic>));
}

/// Represents a successful response with the provided data.
///
/// This class is used when an operation completes successfully and returns data.
class Success<D> extends RequestOutputV2<D> {
  /// The data resulting from a successful operation.
  final D data;

  /// Creates an instance of [Success] with the provided [data].
  const Success(this.data) : super();

  @override
  String toString() => 'Success(data: $data)';
}

/// Represents a failure response with the provided status code failure.
///
/// This class is used when an operation fails and provides details about the failure.
class OnFailure<D> extends RequestOutputV2<D> {
  /// The failure details including status code and error message.
  final StatusCodeFailure failure;

  /// Creates an instance of [OnFailure] with the provided [failure].
  const OnFailure(this.failure) : super();

  @override
  String toString() => 'OnFailure(failure: $failure)';
}

/// Represents an exception response with the provided error and stack trace.
///
/// This class is used when an unexpected exception occurs during the operation.
class OnException<D> extends RequestOutputV2<D> {
  /// The exception that occurred.
  final Object err;

  /// The stack trace associated with the exception.
  final StackTrace st;

  /// Creates an instance of [OnException] with the provided [err] and [st].
  const OnException(this.err, this.st) : super();

  @override
  String toString() => 'OnException(err: $err, stackTrace: $st)';
}

/// Extension methods for converting [RequestOutputV2] instances into [Either]
/// types for error handling and chaining operations.
///
/// This extension provides utility methods for transforming the state of a
/// `RequestOutputV2` instance into an [Either] type or a new value of type
/// `[TResult]`. It supports mapping based on the current state (success, failure,
/// or exception) and handles errors during the mapping process.
///
/// ### Methods
///
/// - [mapToEither]: Maps the instance to an [Either] type using provided functions
///   for each possible state: success, failure, or exception.
/// - [chainToEither]: Chains the instance to an [Either] type where the function
///   provided for the success state returns an [Either] itself.
/// - [mapTry]: Maps the instance to a new value of type `[TResult]` based on provided
///   functions for each possible state, handling any exceptions that occur during
///   the mapping process.
/// - [whenTry]: Executes one of the provided functions based on the current state of
///   the `RequestOutputV2` instance, handling any exceptions that occur during the
///   function execution.
///
/// ### Examples
///
/// ```dart
/// final eitherResult = output.mapToEither(
///   onSuccess: (data) => 'Success: $data',
///   onFailure: (failure) => 'Error: $failure',
///   onException: (err, st) => 'Exception: $err',
/// );
///
/// final chainedEither = output.chainToEither(
///   onSuccess: (data) => right('Success: $data'),
///   onFailure: (failure) => left('Error: $failure'),
///   onException: (err, st) => left('Exception: $err'),
/// );
///
/// final mappedResult = output.mapTry(
///   onSuccess: (success) => 'Success: ${success.data}',
///   onFailure: (failure) => 'Error: ${failure.failure}',
///   onException: (exception) => 'Exception: ${exception.err}',
/// );
///
/// final whenResult = output.whenTry(
///   onSuccess: (data) => 'Success: $data',
///   onFailure: (failure) => 'Error: $failure',
///   onException: (err, st) => 'Exception: $err',
/// );
/// ```
///
/// The `mapToEither` method maps the instance into an [Either] type where:
/// - `right` is used for successful cases.
/// - `left` is used for failure and exception cases.
///
/// The `chainToEither` method chains the instance into an [Either] type where:
/// - `onSuccess` provides the result as an `Either`.
/// - `onFailure` and `onException` are converted into `left`.
///
/// The `mapTry` method attempts to map the instance into a new value while handling
/// any exceptions during the mapping process. The function used in `onException`
/// is called if an error occurs during mapping.
///
/// The `whenTry` method executes one of the provided functions based on the current
/// state of the instance. It handles any exceptions thrown during the execution
/// of these functions and processes them using the `onException` function.
///
/// In the `whenTry` example:
/// - If `output` is successful, `whenResult` will be 'Success: <data>'.
/// - If `output` is a failure, `whenResult` will be 'Error: <failure>'.
/// - If `output` encountered an exception, `whenResult` will be 'Exception: <error>'.

extension RequestOutputV2Either<D> on RequestOutputV2<D> {
  /// Maps the [RequestOutputV2] instance to an [Either] type using the provided
  /// functions for each possible state: success, failure, or exception.
  ///
  /// - [onSuccess]: Function to handle the successful case.
  /// - [onFailure]: Function to handle the failure case.
  /// - [onException]: Function to handle the exception case.
  ///
  /// Example usage:
  /// ```dart
  /// final eitherResult = output.mapToEither(
  ///   onSuccess: (data) => 'Success: $data',
  ///   onFailure: (failure) => 'Error: $failure',
  ///   onException: (err, st) => 'Exception: $err',
  /// );
  /// ```
  Either<F, R> mapToEither<F, R>({
    required R Function(D data) onSuccess,
    required F Function(StatusCodeFailure failure) onFailure,
    required F Function(Object err, StackTrace st) onException,
  }) {
    try {
      return switch (this) {
        Success<D>(:final data) => right(onSuccess(data)),
        OnFailure<D>(:final failure) => left(onFailure(failure)),
        OnException<D>(:final err, :final st) => left(onException(err, st)),
      };
    } catch (err, st) {
      return left(onException(err, st));
    }
  }

  /// Chains the [RequestOutputV2] instance to an [Either] type using the provided
  /// functions for each possible state: success, failure, or exception.
  ///
  /// - [onSuccess]: Function to handle the successful case and return an [Either] type.
  /// - [onFailure]: Function to handle the failure case and return an error value.
  /// - [onException]: Function to handle the exception case and return an error value.
  ///
  /// Example usage:
  /// ```dart
  /// final chainedEither = output.chainToEither(
  ///   onSuccess: (data) => data.isOk ? right('Success: $data') : left('Data not OK'),
  ///   onFailure: (failure) => 'Error: $failure',
  ///   onException: (err, st) => 'Exception: $err',
  /// );
  /// ```
  Either<F, R> chainToEither<F, R>({
    required Either<F, R> Function(D data) onSuccess,
    required F Function(StatusCodeFailure failure) onFailure,
    required F Function(Object err, StackTrace st) onException,
  }) {
    try {
      return switch (this) {
        Success<D>(:final data) => onSuccess(data),
        OnFailure<D>(:final failure) => left(onFailure(failure)),
        OnException<D>(:final err, :final st) => left(onException(err, st)),
      };
    } catch (err, st) {
      return left(onException(err, st));
    }
  }

  /// Maps the [RequestOutputV2] instance to a new value of type [TResult] based on
  /// the provided functions for each possible state: success, failure, or exception.
  ///
  /// This method applies the corresponding function to the current state of the
  /// `RequestOutputV2` instance. If the instance is in a success state, the `onSuccess`
  /// function is used. If it is in a failure state, the `onFailure` function is used.
  /// If it is in an exception state, the `onException` function is used. The mapping is
  /// performed inside a try-catch block to handle any potential errors thrown by the
  /// mapping functions.
  ///
  /// - [onSuccess]: A function that takes the successful data of type [D] and returns
  ///   a value of type [TResult].
  /// - [onFailure]: A function that takes the failure details of type [StatusCodeFailure]
  ///   and returns a value of type [TResult].
  /// - [onException]: A function that takes the exception [Object] and [StackTrace]
  ///   and returns a value of type [TResult].
  ///
  /// The method ensures that if an error occurs during the mapping process, it is handled
  /// and the `onException` function is called to process the error.
  ///
  /// ### Example
  ///
  /// ```dart
  /// final result = output.mapTry(
  ///   onSuccess: (data) => 'Success: $data',
  ///   onFailure: (failure) => 'Error: $failure',
  ///   onException: (err, st) => 'Exception: $err',
  /// );
  /// ```
  ///
  /// In this example, if `output` is successful, `result` will be 'Success: <data>'. If
  /// `output` is a failure, `result` will be 'Error: <failure>'. If `output` encountered
  /// an exception, `result` will be 'Exception: <error>'.
  TResult whenTry<TResult extends Object?>({
    required TResult Function(D data) onSuccess,
    required TResult Function(StatusCodeFailure failure) onFailure,
    required TResult Function(Object err, StackTrace st) onException,
  }) {
    try {
      return switch (this) {
        Success<D>(:final data) => onSuccess(data),
        OnFailure<D>(:final failure) => onFailure(failure),
        OnException<D>(:final err, :final st) => onException(err, st),
      };
    } catch (err, st) {
      return onException(err, st);
    }
  }

  /// Maps the [RequestOutputV2] instance to a new value of type [TResult] based on
  /// the provided functions for each possible state: success, failure, or exception.
  ///
  /// This method applies the corresponding function to the current state of the
  /// `RequestOutputV2` instance. If the instance is in a success state, the `onSuccess`
  /// function is used. If it is in a failure state, the `onFailure` function is used.
  /// If it is in an exception state, the `onException` function is used. The mapping is
  /// performed inside a try-catch block to handle any potential errors thrown by the
  /// mapping functions.
  ///
  /// - [onSuccess]: A function that takes a [Success<D>] instance and returns a value of type [TResult].
  /// - [onFailure]: A function that takes an [OnFailure<D>] instance and returns a value of type [TResult].
  /// - [onException]: A function that takes an [OnException<D>] instance and returns a value of type [TResult].
  ///
  /// The method ensures that if an error occurs during the mapping process, it is handled
  /// and the `onException` function is called to process the error.
  ///
  /// ### Example
  ///
  /// ```dart
  /// final result = output.mapTry(
  ///   onSuccess: (success) => 'Success: ${success.data}',
  ///   onFailure: (failure) => 'Error: ${failure.failure}',
  ///   onException: (exception) => 'Exception: ${exception.err}',
  /// );
  /// ```
  ///
  /// In this example, if `output` is successful, `result` will be 'Success: <data>'. If
  /// `output` is a failure, `result` will be 'Error: <failure>'. If `output` encountered
  /// an exception, `result` will be 'Exception: <error>'.
  TResult mapTry<TResult extends Object?>({
    required TResult Function(Success<D> success) onSuccess,
    required TResult Function(OnFailure<D> failure) onFailure,
    required TResult Function(OnException<D> exception) onException,
  }) {
    try {
      return switch (this) {
        final Success<D> success => onSuccess(success),
        final OnFailure<D> failure => onFailure(failure),
        final OnException<D> exception => onException(exception),
      };
    } catch (err, st) {
      return onException(OnException<D>(err, st));
    }
  }
}
