import 'package:xatter/datasource/firebase_firestore/firebase_firestore_datasource.dart';
import 'package:xatter/domain/models/conversation.dart';
import 'package:xatter/domain/use_cases/conversation/get_conversations_use_case.dart';
import 'package:xatter/utils/firestore_paths.dart';
import 'package:xatter/utils/map_reader.dart';

class FirestoreGetConversationsUseCase implements GetConversationsUseCase {
  final FirebaseFirestoreDatasource datasource;

  FirestoreGetConversationsUseCase({required this.datasource});

  @override
  Future<List<ConversationBase>> call() async {
    final result = await datasource.getCollection(
      path: FirestorePaths.conversations(),
    );

    return result.map((e) => ConversationBase.fromJson(MapReader(e))).toList();
  }
}
