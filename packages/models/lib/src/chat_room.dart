import 'package:equatable/equatable.dart';
import 'package:models/models.dart';
import 'package:uuid/uuid.dart';

class ChatRoom extends Equatable {
  final String id;
  final List<User> participants;
  final Message lastMessage;
  final int unreadCount;

  const ChatRoom({
    required this.id,
    required this.participants,
    required this.lastMessage,
    required this.unreadCount,
  });

  ChatRoom copyWith({
    String? id,
    List<User>? participants,
    Message? lastMessage,
    int? unreadCount,
  }) {
    return ChatRoom(
      id: id ?? this.id,
      participants: participants ?? this.participants,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      id: json['id'] ?? const Uuid().v4(),
      participants: (json['participants'] is List)
          ? json['participants']
              .map<User>((user) => User.fromJson(user))
              .toList()
          : [],
      lastMessage: Message.fromJson(json['last_message'] ?? {}),
      unreadCount: json['unread_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participants': participants,
      'lastMessage': lastMessage.toJson(),
      'unreadCount': unreadCount,
    };
  }

  @override
  List<Object?> get props => [id, participants, lastMessage, unreadCount];
}
