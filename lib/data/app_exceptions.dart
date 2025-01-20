class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error During Communication : ');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid Request : ');
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized Request : ');
}

class NotFoundException extends AppExceptions {
  NotFoundException([String? message]) : super(message, 'Request Not Found : ');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, 'Invalid Input : ');
}
