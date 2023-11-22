import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum AttachmentType { image, video, audio }

class Attachment extends Equatable {
  final String id;
  final String messageId;
  final AttachmentType type;
  final String attachmentUrl;

  const Attachment({
    required this.id,
    required this.messageId,
    required this.type,
    required this.attachmentUrl,
  });

  Attachment copyWith({
    String? id,
    String? messageId,
    AttachmentType? type,
    String? attachmentUrl,
  }) {
    return Attachment(
      id: id ?? this.id,
      messageId: messageId ?? this.messageId,
      type: type ?? this.type,
      attachmentUrl: attachmentUrl ?? this.attachmentUrl,
    );
  }

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'] ?? const Uuid().v4(),
      messageId: json['messageId'] ?? '',
      type: AttachmentType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
        orElse: () => AttachmentType.image,
      ),
      attachmentUrl: json['attachmentUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'messageId': messageId,
      'type': type.toString().split('.').last,
      'attachmentUrl': attachmentUrl,
    };
  }

  @override
  List<Object?> get props => [id, messageId, type, attachmentUrl];

  static List<Attachment> sampleData = [
    Attachment(
      id: const Uuid().v4(),
      messageId: const Uuid().v4(),
      type: AttachmentType.image,
      attachmentUrl: 'https://source.unsplash.com/random/?scenery',
    ),
  ];
}
