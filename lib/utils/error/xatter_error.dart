class XatterError implements Exception {
  final String userMessage;
  final String internalMessage;
  final StackTrace stackTrace;

  XatterError({
    required this.userMessage,
    required this.internalMessage,
    required this.stackTrace,
  });
}
