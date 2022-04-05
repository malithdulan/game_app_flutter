class NoInternetException implements Exception {
  final String error;
  NoInternetException(this.error);
}

class InternetCheckException implements Exception {
  final String error;
  InternetCheckException(this.error);
}

class NetworkException implements Exception {
  final String error;
  NetworkException(this.error);
}

class CustomError implements Exception {}