class NoInternetException implements Exception {
  final String error;
  NoInternetException(this.error);
}

class NetworkException implements Exception {
  final String error;
  NetworkException(this.error);
}

class CustomError implements Exception {}