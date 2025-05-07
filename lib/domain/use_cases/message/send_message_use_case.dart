abstract class SendMessageUseCase {
  Future<void> call({required String conversationId, required String message});
}
