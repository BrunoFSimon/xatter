import 'package:xatter/domain/models/user.dart';
import 'package:xatter/domain/use_cases/use_case.dart';
import 'package:xatter/domain/use_cases/use_case_result.dart';

typedef SignUserUseCaseParams = ({String cellphone});

abstract class SignUserUseCase implements UseCase<User, SignUserUseCaseParams> {
  @override
  Future<UseCaseResult<User>> call(SignUserUseCaseParams params);
}
