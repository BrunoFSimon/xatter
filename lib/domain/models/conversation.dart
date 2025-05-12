import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xatter/utils/map_reader.dart';

class ConversationBase {
  final String senderName;
  final String senderId;
  final String? lastMessageText;
  final Timestamp? lastMessageTime;

  const ConversationBase({
    required this.senderName,
    required this.senderId,
    required this.lastMessageText,
    required this.lastMessageTime,
  });

  factory ConversationBase.fromJson(MapReader mapReader) {
    return ConversationBase(
      senderName: mapReader.getStringOrEmpty('senderName'),
      senderId: mapReader.getStringOrThrow('senderId'),
      lastMessageText: mapReader.getStringOrNull('lastMessageText'),
      lastMessageTime: mapReader.getTimestampOrNull('lastMessageTime'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderName': senderName,
      'senderId': senderId,
      'lastMessageText': lastMessageText,
      'lastMessageTime': lastMessageTime?.millisecondsSinceEpoch,
    };
  }
}

class Conversation extends ConversationBase {
  final String id;

  Conversation({
    required this.id,
    required super.senderName,
    required super.senderId,
    required super.lastMessageText,
    required super.lastMessageTime,
  });

  factory Conversation.fromJson(MapReader mapReader) {
    final base = ConversationBase.fromJson(mapReader);
    return Conversation(
      id: mapReader.getStringOrThrow('id'),
      senderName: base.senderName,
      senderId: base.senderId,
      lastMessageText: base.lastMessageText,
      lastMessageTime: base.lastMessageTime,
    );
  }
}
