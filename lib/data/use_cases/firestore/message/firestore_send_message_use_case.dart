import 'package:xatter/datasource/firebase_firestore/firebase_firestore_datasource.dart';
import 'package:xatter/domain/models/message.dart';
import 'package:xatter/domain/use_cases/message/send_message_use_case.dart';
import 'package:xatter/utils/firestore_paths.dart';

class FirestoreSendMessageUseCase implements SendMessageUseCase {
  final FirebaseFirestoreDatasource datasource;

  FirestoreSendMessageUseCase({required this.datasource});

  @override
  Future<void> call({
    required String conversationId,
    required String message,
  }) async {
    final model = MessageBase(
      isRead: false,
      sentAt: DateTime.now(),
      text: message,
    );

    final map = model.toJson();

    await datasource.addDoc(
      collectionPath: FirestorePaths.messages(conversationId: conversationId),
      data: map,
    );
  }
}
