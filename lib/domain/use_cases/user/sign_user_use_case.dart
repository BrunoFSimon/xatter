import 'package:xatter/domain/models/user.dart';

abstract class SignUserUseCase {
  Future<User> call(String cellphone);
}
