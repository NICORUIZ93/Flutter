import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get movieApiKey {
    final apiKey = dotenv.env['THE_MOVIE_KEY']?.trim() ?? '';
    if (apiKey.isEmpty) {
      throw StateError(
        'THE_MOVIE_KEY no esta configurada. Revisa tu archivo .env',
      );
    }
    return apiKey;
  }
}
