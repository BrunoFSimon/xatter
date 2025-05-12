import 'package:xatter/domain/models/user.dart';
import 'package:xatter/domain/use_cases/use_case.dart';
import 'package:xatter/domain/use_cases/use_case_result.dart';

/// [userId] nulo significa que o usuário precisa ser criado
/// [userId] não nulo significa que o usuário precisa ser atualizado
typedef UpdateUserDataUseCaseParams = ({UserBase user, String? userId});

/// [userId] nulo significa que o usuário precisa ser criado
/// [userId] não nulo significa que o usuário precisa ser atualizado
abstract class UpdateUserDataUseCase
    implements UseCase<void, UpdateUserDataUseCaseParams> {
  @override
  Future<UseCaseResult<void>> call(UpdateUserDataUseCaseParams params);
}
