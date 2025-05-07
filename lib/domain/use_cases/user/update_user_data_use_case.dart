import 'package:xatter/domain/models/user.dart';
import 'package:xatter/domain/use_cases/use_case.dart';
import 'package:xatter/domain/use_cases/use_case_result.dart';

typedef UpdateUserDataUseCaseParams = ({User user});

abstract class UpdateUserDataUseCase
    implements UseCase<void, UpdateUserDataUseCaseParams> {
  @override
  Future<UseCaseResult<void>> call(UpdateUserDataUseCaseParams params);
}
