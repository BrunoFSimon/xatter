import 'package:xatter/domain/use_cases/use_case.dart';
import 'package:xatter/domain/use_cases/use_case_result.dart';

typedef SendMessageUseCaseParams = ({String conversationId, String message});

abstract class SendMessageUseCase
    implements UseCase<void, SendMessageUseCaseParams> {
  @override
  Future<UseCaseResult<void>> call(SendMessageUseCaseParams params);
}
