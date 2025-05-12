import 'package:xatter/datasource/firebase_firestore/firebase_firestore_datasource.dart';
import 'package:xatter/domain/use_cases/use_case_result.dart';
import 'package:xatter/domain/use_cases/user/update_user_data_use_case.dart';
import 'package:xatter/utils/error/xatter_error.dart';
import 'package:xatter/utils/firestore_paths.dart';

class FirestoreUpdateUserDataUseCase implements UpdateUserDataUseCase {
  final FirebaseFirestoreDatasource datasource;

  FirestoreUpdateUserDataUseCase({required this.datasource});

  @override
  Future<UseCaseResult<void>> call(UpdateUserDataUseCaseParams params) async {
    try {
      final userId = params.userId;

      switch (userId) {
        case null:
          await datasource.addDoc(
            collectionPath: FirestorePaths.users(),
            data: params.user.toJson(),
          );
          break;
        case != null:
          final path = FirestorePaths.user(userId: userId);
          final map = params.user.toJson();
          await datasource.updateDoc(path: path, data: map);
          break;
      }

      return UseCaseResult.success(null);
    } catch (e, s) {
      return UseCaseResult.failure(
        XatterError(
          internalMessage: e.toString(),
          userMessage: 'Falha ao atualizar dados do usuário',
          stackTrace: s,
        ),
      );
    }
  }
}
