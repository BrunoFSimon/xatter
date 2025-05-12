abstract class FirestorePaths {
  static String conversations() {
    return 'conversations';
  }

  static String messages({required String conversationId}) {
    return 'conversations/$conversationId/messages';
  }

  static String users() {
    return 'users';
  }

  static String user({required String userId}) {
    return 'users/$userId';
  }
}
