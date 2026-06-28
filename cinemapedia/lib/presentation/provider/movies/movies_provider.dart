import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayMoviesProvider = StateNotifierProvider((ref) {
  return MoviesNotifier(fetch);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;
  MoviesNotifier(this.fetchMoreMovies) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state.addAll(movies);
  }
}
