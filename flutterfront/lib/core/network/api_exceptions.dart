class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

class FetchDataException extends ApiException {
  FetchDataException(super.message);
}

class BadRequestException extends ApiException {
  BadRequestException(super.message);
}

class UnauthorisedException extends ApiException {
  UnauthorisedException(super.message);
}

class ResourceNotFoundException extends ApiException {
  ResourceNotFoundException(super.message);
}
