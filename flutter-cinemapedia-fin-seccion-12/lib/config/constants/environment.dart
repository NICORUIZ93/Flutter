import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  // Backward compatible with previous typo in .env key.
  static String theMovieDbKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? dotenv.env['THE_MOVIE_KEY'] ?? '';

  static bool get hasMovieDbKey => theMovieDbKey.trim().isNotEmpty;
}
