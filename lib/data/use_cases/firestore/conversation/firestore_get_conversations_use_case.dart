import 'package:xatter/datasource/firebase_firestore/firebase_firestore_datasource.dart';
import 'package:xatter/domain/models/conversation.dart';
import 'package:xatter/domain/use_cases/conversation/get_conversations_use_case.dart';
import 'package:xatter/domain/use_cases/use_case_no_params.dart';
import 'package:xatter/domain/use_cases/use_case_result.dart';
import 'package:xatter/utils/error/xatter_error.dart';
import 'package:xatter/utils/firestore_paths.dart';
import 'package:xatter/utils/map_reader.dart';

class FirestoreGetConversationsUseCase implements GetConversationsUseCase {
  final FirebaseFirestoreDatasource datasource;

  FirestoreGetConversationsUseCase({required this.datasource});

  @override
  Future<UseCaseResult<List<Conversation>>> call(UseCaseNoParams params) async {
    try {
      final result = await datasource.getCollection(
        path: FirestorePaths.conversations(),
      );

      final conversations =
          result.map((e) => Conversation.fromJson(MapReader(e))).toList();

      return UseCaseResult.success(conversations);
    } catch (e, s) {
      return UseCaseResult.failure(
        XatterError(
          internalMessage: e.toString(),
          userMessage: 'Falha ao obter conversas',
          stackTrace: s,
        ),
      );
    }
  }
}
