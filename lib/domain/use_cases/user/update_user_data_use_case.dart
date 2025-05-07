import 'package:xatter/domain/models/user.dart';

abstract class UpdateUserDataUseCase {
  Future<void> call({required User user});
}
