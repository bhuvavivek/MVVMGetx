class AppException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

// 1001 status code exception - No Internet.
class InternetException extends AppException {
  InternetException([String message = '']) : super(message, 'no internet');
}

// 1002 status code exception - Run Time Exception.
class RunTimeException extends AppException {
  RunTimeException([String message = ''])
      : super(message, 'RunTimeException: ');
}

// 404 status code exception - Not Found.
class NotFoundException extends AppException {
  NotFoundException([String message = '']) : super(message, 'Not Found');
}

// 401 status code exception - Unauthorised access.
class UnauthorizedException extends AppException {
  UnauthorizedException([String message = ''])
      : super(message, 'Unauthorized: ');
}

// 400 status code exception - Bad Request.
class BadRequestException extends AppException {
  BadRequestException([String message = '']) : super(message, 'Bad Request: ');
}

// 500 status code exception - Server Error.
class ServerException extends AppException {
  ServerException([String message = '']) : super(message, 'Server Error: ');
}

class UnknownErorrException extends AppException {
  UnknownErorrException([String message = ''])
      : super(message, 'Unknownerror Error: ');
}
