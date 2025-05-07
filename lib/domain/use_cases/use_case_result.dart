import 'package:xatter/utils/error/xatter_error.dart';

class UseCaseResult<TResult> {
  final TResult? result;
  final XatterError? error;

  UseCaseResult._({required this.result, required this.error});

  factory UseCaseResult.success(TResult result) {
    return UseCaseResult._(result: result, error: null);
  }

  factory UseCaseResult.failure(XatterError error) {
    return UseCaseResult._(result: null, error: error);
  }

  R fold<R>({
    required R Function(TResult success) onSuccess,
    required R Function(XatterError failure) onFailure,
  }) {
    final successValue = result;
    final failureValue = error;

    if (successValue != null) {
      return onSuccess(successValue);
    }

    if (failureValue != null) {
      return onFailure(failureValue);
    }

    throw StateError('Result is null');
  }
}
