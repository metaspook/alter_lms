class SocketException implements Exception {
  const SocketException([this.message = 'Connection error']);
  final String message;
}

class HttpException implements Exception {
  const HttpException([this.message = 'Http error', this.statusCode]);
  final String message;
  final int? statusCode;
}
