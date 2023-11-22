import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String phone;
  final String email;
  final String avatarUrl;
  final String status;

  const User({
    required this.id,
    required this.username,
    required this.phone,
    required this.email,
    required this.avatarUrl,
    required this.status,
  });

  User copyWith({
    String? id,
    String? username,
    String? phone,
    String? email,
    String? avatarUrl,
    String? status,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      status: status ?? this.status,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? const Uuid().v4(),
      username: json['username'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      avatarUrl:
          json['avatar_url'] ?? 'https://source.unsplash.com/random/?profile',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'phone': phone,
      'email': email,
      'avatarUrl': avatarUrl,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [id, username, phone, email, avatarUrl, status];
}


// [{
//   chat_room_id: 8baf5ca2-e254-49e6-ac97-70e40559574d, 
//   participant_id: a6d06c87-a657-4473-b223-d5d53e895e15, 
//   users: {
//     id: a6d06c87-a657-4473-b223-d5d53e895e15, 
//     updated_at: null, username: null, 
//     email: null, phone: 971583060255, avatar_url: null}
//   }
// ], 