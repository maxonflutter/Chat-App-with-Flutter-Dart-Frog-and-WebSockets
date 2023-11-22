import 'dart:io';

import 'package:api/src/env/env.dart';
import 'package:api/src/repositories/message_repository.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:supabase/supabase.dart';

late MessageRepository messageRepository;

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  final dbClient = SupabaseClient(
    Env.SUPABASE_URL,
    Env.SUPABASE_SERVICE_ROLE_KEY, // Use it only in the server, never on the client side.
  );

  messageRepository = MessageRepository(dbClient: dbClient);

  return serve(handler, ip, port);
}
