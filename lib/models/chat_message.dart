import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'chat_message.g.dart';

// After Completing run this command: flutter pub run build_runner build

@JsonSerializable()
class ChatMessage{
  final String messageContent;
  final int messageType;
  String? idTo;
  String? idFrom;
   String timestamp;
  ChatMessage({required this.messageContent, required this.messageType, this.idFrom, this.idTo,  required this.timestamp});

  factory ChatMessage.fromDocument(DocumentSnapshot documentSnapshot) {
    String idFrom = documentSnapshot.get('idFrom');
    String idTo = documentSnapshot.get('idTo');
    String timestamp = documentSnapshot.get('timestamp');
    String content = documentSnapshot.get('messageContent');
    int type = documentSnapshot.get('messageType');

    return ChatMessage(
        idFrom: idFrom,
        idTo: idTo,
        timestamp: timestamp,
        messageContent: content,
        messageType: type);
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

}
