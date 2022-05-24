// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      messageContent: json['messageContent'] as String,
      messageType: json['messageType'] as int,
      idFrom: json['idFrom'] as String?,
      idTo: json['idTo'] as String?,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'messageContent': instance.messageContent,
      'messageType': instance.messageType,
      'idTo': instance.idTo,
      'idFrom': instance.idFrom,
      'timestamp': instance.timestamp,
    };
