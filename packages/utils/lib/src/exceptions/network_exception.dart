import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:utils/utils.dart';

enum NetworkExceptionType {
  offlineClient,
  offlineServer,
  malformedRequest,
  malformedResponse,
  unknown,
}

final class NetworkException extends Equatable implements Exception {
  const NetworkException(
    this.type, {
    this.message = 'Unknown error occurred!',
    this.statusCode,
  });

  /// Also handles private `_ClientSocketException` from http by staying
  /// `SocketException` above the `ClientException`.
  factory NetworkException.from(Exception exception, [int? statusCode]) {
    return switch (exception) {
      SocketException() => const NetworkException(
        NetworkExceptionType.offlineServer,
        message: 'Server is unreachable!',
      ),
      ClientException() => NetworkException(
        NetworkExceptionType.malformedResponse,
        message: 'Invalid response format!',
        statusCode: statusCode,
      ),
      TimeoutException() => const NetworkException(
        NetworkExceptionType.offlineServer,
        message: 'Server is offline!',
      ),
      FormatException() => const NetworkException(
        NetworkExceptionType.malformedRequest,
        message: 'Invalid request format!',
      ),
      HttpException() => NetworkException(
        NetworkExceptionType.malformedResponse,
        message: 'Invalid response format!',
        statusCode: statusCode,
      ),
      _ => const NetworkException(NetworkExceptionType.unknown),
    };
  }

  static const offline = NetworkException(
    NetworkExceptionType.offlineClient,
    message: 'No internet connection!',
  );

  final NetworkExceptionType type;
  final int? statusCode;
  final String message;

  @override
  List<Object?> get props => [type, message, statusCode];
}
