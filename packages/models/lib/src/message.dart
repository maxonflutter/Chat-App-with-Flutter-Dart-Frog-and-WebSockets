import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../models.dart';

class Message extends Equatable {
  final String? id;
  final String chatRoomId;
  final String senderUserId;
  final String receiverUserId;
  final String? content;
  final Attachment? attachment;
  final DateTime createdAt;

  const Message({
    this.id,
    required this.chatRoomId,
    required this.senderUserId,
    required this.receiverUserId,
    this.content,
    this.attachment,
    required this.createdAt,
  });

  Message copyWith({
    String? id,
    String? chatRoomId,
    String? senderUserId,
    String? receiverUserId,
    String? content,
    Attachment? attachment,
    DateTime? createdAt,
  }) {
    return Message(
      id: id ?? this.id,
      chatRoomId: chatRoomId ?? this.chatRoomId,
      senderUserId: senderUserId ?? this.senderUserId,
      receiverUserId: receiverUserId ?? this.receiverUserId,
      content: content ?? this.content,
      attachment: attachment ?? this.attachment,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? const Uuid().v4(),
      chatRoomId: json['chat_room_id'] ?? '',
      senderUserId: json['sender_user_id'] ?? '',
      receiverUserId: json['receiver_user_id'] ?? '',
      content: json['content'],
      attachment: json['attachment'] != null
          ? Attachment.fromJson(json['attachment'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chat_room_id': chatRoomId,
      'sender_user_id': senderUserId,
      'receiver_user_id': receiverUserId,
      'content': content,
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        chatRoomId,
        senderUserId,
        receiverUserId,
        content,
        attachment,
        createdAt,
      ];
}
