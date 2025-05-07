import 'package:xatter/domain/models/message.dart';

// TODO : adicionar paginação
// TODO : adicionar busca de mensagens por texto
// TODO : adicionar filtragem de mensagens por data

/// retorna a lista de mensagens de uma conversa
abstract class GetConversationMessagesUseCase {
  Future<List<MessageBase>> call({required String conversationId});
}
