import 'package:xatter/domain/models/conversation.dart';

/// retorna a lista de conversas
abstract class GetConversationsUseCase {
  Future<List<ConversationBase>> call();
}
