import 'package:supabase/supabase.dart';

class MessageRepository {
  final SupabaseClient dbClient;

  const MessageRepository({required this.dbClient});

  Future<Map<String, dynamic>> createMessage(Map<String, dynamic> data) async {
    try {
      return await dbClient.from('messages').insert(data).select().single();
    } catch (err) {
      throw Exception(err);
    }
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
