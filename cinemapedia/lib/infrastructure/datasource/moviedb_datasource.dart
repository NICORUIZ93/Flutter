import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasource/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/datasource/model/moviedb/moviedb_response.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Environment.movieApiKey, 'language': 'es-MX'},
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    try {
      final response = await dio.get(
        '/movie/now_playing',
        queryParameters: {'page': page},
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw const FormatException('Respuesta invalida de TMDB');
      }

      final movieDbResponse = MovieDbResponse.fromJson(data);
      return movieDbResponse.results.map((movie) => movie.toEntity()).toList();
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;

      if (statusCode == 401) {
        throw Exception(
          'TMDB API key invalida o faltante. Revisa THE_MOVIE_KEY en .env',
        );
      }

      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception(
          'No se pudo conectar a TMDB. Verifica tu conexion a internet.',
        );
      }

      throw Exception('Error consultando TMDB (${statusCode ?? 'sin codigo'}).');
    } on FormatException {
      rethrow;
    } catch (e) {
      throw Exception('Error inesperado obteniendo peliculas: $e');
    }
  }

}


