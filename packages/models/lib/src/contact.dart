import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Contact extends Equatable {
  final String id;
  final String userId;
  final String contactName;
  final String phoneNumber;
  final String? avatarUrl;

  const Contact({
    required this.id,
    required this.userId,
    required this.contactName,
    required this.phoneNumber,
    this.avatarUrl,
  });

  Contact copyWith({
    String? id,
    String? userId,
    String? contactName,
    String? phoneNumber,
    String? avatarUrl,
  }) {
    return Contact(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      contactName: contactName ?? this.contactName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  // factory Contact.fromJson(Map<String, dynamic> json) {
  //   return Contact(
  //     id: json['id'] ?? const Uuid().v4(),
  //     userId: json['user_id'] ?? '',
  //     contactName: json['contact_name'] ?? '',
  //     phoneNumber: json['phone_number'] ?? '',
  //     avatarUrl: json['avatar_url'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'contact_name': contactName,
      'phone_number': phoneNumber,
      'avatar_url': avatarUrl,
    };
  }

  static List<Contact> sampleData = [
    Contact(
      id: const Uuid().v4(),
      userId: const Uuid().v4(),
      contactName: 'Alice Smith',
      phoneNumber: '123-456-7890',
      avatarUrl: 'https://source.unsplash.com/random/?portrait',
    ),
    Contact(
      id: const Uuid().v4(),
      userId: const Uuid().v4(),
      contactName: 'Bob Johnson',
      phoneNumber: '098-765-4321',
      avatarUrl: 'https://source.unsplash.com/random/?face',
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        userId,
        contactName,
        phoneNumber,
        avatarUrl,
      ];
}
