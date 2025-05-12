import 'package:xatter/datasource/firebase_firestore/firebase_firestore_datasource.dart';
import 'package:xatter/domain/models/message.dart';
import 'package:xatter/domain/use_cases/message/get_conversation_messages_use_case.dart';
import 'package:xatter/domain/use_cases/use_case_result.dart';
import 'package:xatter/utils/error/xatter_error.dart';
import 'package:xatter/utils/firestore_paths.dart';
import 'package:xatter/utils/map_reader.dart';

class FirestoreGetConversationMessagesUseCase
    implements GetConversationMessagesUseCase {
  final FirebaseFirestoreDatasource datasource;

  FirestoreGetConversationMessagesUseCase({required this.datasource});

  @override
  Future<UseCaseResult<List<Message>>> call(
    GetConversationMessagesUseCaseParams params,
  ) async {
    try {
      final result = await datasource.getCollection(
        path: FirestorePaths.messages(conversationId: params.conversationId),
      );

      final list =
          result
              .map((element) => Message.fromJson(MapReader(element)))
              .toList();

      return UseCaseResult.success(list);
    } catch (e, s) {
      return UseCaseResult.failure(
        XatterError(
          internalMessage: e.toString(),
          userMessage: 'Falha ao obter mensagens da conversa',
          stackTrace: s,
        ),
      );
    }
  }
}
