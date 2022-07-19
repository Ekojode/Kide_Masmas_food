class NetworkExceptions implements Exception {
  final String message;
  NetworkExceptions(this.message);

  @override
  String toString() {
    return message;
  }
}
