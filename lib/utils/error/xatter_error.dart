class XatterError implements Exception {
  final String userMessage;
  final String internalMessage;

  XatterError({required this.userMessage, required this.internalMessage});
}
