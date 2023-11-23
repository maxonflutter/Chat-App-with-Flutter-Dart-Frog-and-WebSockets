import 'repositories/message_repository.dart';
import 'services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import 'screens/chat_room_screen.dart';

final apiClient = ApiClient(tokenProvider: () async {
  // TODO: Get the bearer token of the current user.
  return '';
});

final messageRepository = MessageRepository(apiClient: apiClient);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChatRoomScreen(chatRoom: chatRoom),
    );
  }
}

const userId1 = 'dea9782b-ffe8-4660-a554-5100127307d2';
const userId2 = 'b74e326d-b37a-4c46-a8d4-0712021aadba';

final chatRoom = ChatRoom(
  id: '8d162274-6cb8-4776-815a-8e721ebfb76d',
  participants: const [
    User(
      id: userId1,
      username: 'User 1',
      phone: '1234512345',
      email: 'user1@email.com',
      avatarUrl:
          'https://images.unsplash.com/photo-1700493624764-f7524969037d?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      status: 'online',
    ),
    User(
      id: userId2,
      username: 'User 2',
      phone: '5432154321',
      email: 'user2@email.com',
      avatarUrl:
          'https://images.unsplash.com/photo-1700469880511-3ef0cee47985?q=80&w=3672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      status: 'online',
    ),
  ],
  lastMessage: Message(
    id: 'de120f3a-dbca-4330-9e2e-18b55a2fb9e5',
    chatRoomId: '8d162274-6cb8-4776-815a-8e721ebfb76d',
    senderUserId: userId1,
    receiverUserId: userId2,
    content: 'Hey! I am good, thanks.',
    createdAt: DateTime(2023, 12, 1, 1, 0, 0),
  ),
  unreadCount: 0,
);

final messages = [
  Message(
    id: 'de120f3a-dbca-4330-9e2e-18b55a2fb9e5',
    chatRoomId: '8d162274-6cb8-4776-815a-8e721ebfb76d',
    senderUserId: userId1,
    receiverUserId: userId2,
    content: 'Hey! I am good, thanks.',
    createdAt: DateTime(2023, 12, 1, 1, 0, 10),
  ),
  Message(
    id: '29829a84-30b9-47e9-b6df-518519843f7d',
    chatRoomId: '8d162274-6cb8-4776-815a-8e721ebfb76d',
    senderUserId: userId2,
    receiverUserId: userId1,
    content: 'Hey! How are you?',
    createdAt: DateTime(2023, 12, 1, 1, 0, 0),
  ),
];
