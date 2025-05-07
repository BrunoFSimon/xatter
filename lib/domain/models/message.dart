import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xatter/utils/map_reader.dart';

class MessageBase {
  final String text;
  final bool isRead;
  final DateTime sentAt;

  MessageBase({required this.text, required this.isRead, required this.sentAt});

  factory MessageBase.fromJson(MapReader mapReader) {
    return MessageBase(
      text: mapReader.getStringOrThrow('text'),
      isRead: mapReader.getBoolOrFalse('isRead'),
      sentAt: mapReader.getTimestampOrThrow('sentAt').toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'isRead': isRead,
      'sentAt': Timestamp.fromDate(sentAt),
    };
  }
}

class Message extends MessageBase {
  final String id;

  Message({
    required this.id,
    required super.text,
    required super.isRead,
    required super.sentAt,
  });

  factory Message.fromFirestoreMap(MapReader mapReader) {
    final base = MessageBase.fromJson(mapReader);
    return Message(
      id: mapReader.getStringOrThrow('id'),
      text: base.text,
      isRead: base.isRead,
      sentAt: base.sentAt,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {...super.toJson(), 'id': id};
  }
}
