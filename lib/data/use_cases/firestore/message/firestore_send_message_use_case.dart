import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xatter/datasource/firebase_firestore/firebase_firestore_datasource.dart';
import 'package:xatter/domain/models/message.dart';
import 'package:xatter/domain/use_cases/message/send_message_use_case.dart';
import 'package:xatter/domain/use_cases/use_case_result.dart';
import 'package:xatter/utils/error/xatter_error.dart';
import 'package:xatter/utils/firestore_paths.dart';

class FirestoreSendMessageUseCase implements SendMessageUseCase {
  final FirebaseFirestoreDatasource datasource;

  FirestoreSendMessageUseCase({required this.datasource});

  @override
  Future<UseCaseResult<void>> call(SendMessageUseCaseParams params) async {
    try {
      final model = MessageBase(
        isRead: false,
        sentAt: Timestamp.fromDate(DateTime.now()),
        text: params.message,
      );

      final map = model.toJson();

      await datasource.addDoc(
        collectionPath: FirestorePaths.messages(
          conversationId: params.conversationId,
        ),
        data: map,
      );

      return UseCaseResult.success(null);
    } catch (e, s) {
      return UseCaseResult.failure(
        XatterError(
          internalMessage: e.toString(),
          userMessage: 'Falha ao enviar mensagem',
          stackTrace: s,
        ),
      );
    }
  }
}
