import 'package:cinemapedia/domain/repositories/movie_repository.dart';
import 'package:cinemapedia/infrastructure/datasource/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movies_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MoviesRepositoryImpl(MoviedbDatasource());
});
