import 'package:supabase/supabase.dart';

class MessageRepository {
  final SupabaseClient dbClient;

  const MessageRepository({required this.dbClient});
  createMessage() {
    throw UnimplementedError();
  }

  Future<List<Map<String, dynamic>>> fetchMessages(String chatRoomId) async {
    try {
      final messages = await dbClient
          .from('messages')
          .select<PostgrestList>()
          .eq('chat_room_id', chatRoomId);

      return messages;
    } catch (err) {
      throw Exception(err);
    }
  }
}
