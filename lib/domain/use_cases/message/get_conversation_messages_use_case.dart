import 'package:xatter/domain/models/message.dart';
import 'package:xatter/domain/use_cases/use_case.dart';
import 'package:xatter/domain/use_cases/use_case_result.dart';

// TODO : adicionar paginação
// TODO : adicionar busca de mensagens por texto
// TODO : adicionar filtragem de mensagens por data

typedef GetConversationMessagesUseCaseParams = ({String conversationId});

/// retorna a lista de mensagens de uma conversa
abstract class GetConversationMessagesUseCase
    implements UseCase<List<Message>, GetConversationMessagesUseCaseParams> {
  @override
  Future<UseCaseResult<List<Message>>> call(
    GetConversationMessagesUseCaseParams params,
  );
}
