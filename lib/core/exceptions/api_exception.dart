sealed class APIException implements Exception {
  APIException(this.message);
  final String message;
}

class NoInternetException extends APIException {
  NoInternetException() : super('No Internet connection!');
}
class TimeoutException extends APIException {
  TimeoutException() : super('Timeout!');
}


class ServerErrorException extends APIException{
  ServerErrorException() : super('Something went wrong!');
}

class UnknownException extends APIException {
  UnknownException() : super('Some error occurred');
}
