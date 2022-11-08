class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message, int? statusCode])
      : super(statusCode.toString(), message);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, int? statusCode])
      : super(statusCode.toString(), message);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message, int? statusCode])
      : super(statusCode.toString(), message);
}

class NotFoundException extends AppException {
  NotFoundException([String? message, int? statusCode])
      : super(statusCode.toString(), message);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message, int? statusCode])
      : super(statusCode.toString(), message);
}
