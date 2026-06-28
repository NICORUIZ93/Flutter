import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/datasource/model/moviedb/movie_moviedb.dart';

extension MovieMapper on MovieFromMovieDb {
  Movie toEntity() {
    return Movie(
      adult: adult,
      backdropPath: backdropPath != ''
          ? 'https://image.tmdb.org/t/p/original$backdropPath'
          : '',
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath != ''
          ? 'https://image.tmdb.org/t/p/original$posterPath'
          : '',
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
