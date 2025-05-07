import 'package:xatter/domain/use_cases/use_case_result.dart';

/// Usar [UseCaseNoParams] quando não houverem parâmetros
abstract class UseCase<TResult, TParams> {
  Future<UseCaseResult<TResult>> call(TParams params);
}
