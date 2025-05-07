abstract class FirestorePaths {
  static String conversations() {
    return 'conversations';
  }

  static String messages({required String conversationId}) {
    return 'conversations/$conversationId/messages';
  }
}
