import 'package:xatter/domain/models/conversation.dart';
import 'package:xatter/domain/use_cases/use_case.dart';
import 'package:xatter/domain/use_cases/use_case_no_params.dart';
import 'package:xatter/domain/use_cases/use_case_result.dart';

/// retorna a lista de conversas
abstract class GetConversationsUseCase
    implements UseCase<List<ConversationBase>, UseCaseNoParams> {
  @override
  Future<UseCaseResult<List<ConversationBase>>> call(UseCaseNoParams params);
}
