import 'dart:convert';

import 'package:cinemapedia/infrastructure/datasource/model/moviedb/movie_moviedb.dart';

MovieDbResponse movieDbResponseFromJson(String str) =>
    MovieDbResponse.fromJson(json.decode(str));

String movieDbResponseToJson(MovieDbResponse data) =>
    json.encode(data.toJson());

class MovieDbResponse {
  final Dates dates;
  final int page;
  final List<MovieFromMovieDb> results;
  final int totalPages;
  final int totalResults;

  MovieDbResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  MovieDbResponse copyWith({
    Dates? dates,
    int? page,
    List<MovieFromMovieDb>? results,
    int? totalPages,
    int? totalResults,
  }) => MovieDbResponse(
    dates: dates ?? this.dates,
    page: page ?? this.page,
    results: results ?? this.results,
    totalPages: totalPages ?? this.totalPages,
    totalResults: totalResults ?? this.totalResults,
  );

  factory MovieDbResponse.fromJson(Map<String, dynamic> json) =>
      MovieDbResponse(
        dates: Dates.fromJson(json["dates"] ?? const {}),
        page: json["page"] ?? 1,
        results: List<MovieFromMovieDb>.from(
          (json["results"] ?? const []).map((x) => MovieFromMovieDb.fromJson(x)),
        ),
        totalPages: json["total_pages"] ?? 0,
        totalResults: json["total_results"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
    "dates": dates.toJson(),
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Dates {
  final DateTime maximum;
  final DateTime minimum;

  Dates({required this.maximum, required this.minimum});

  Dates copyWith({DateTime? maximum, DateTime? minimum}) =>
      Dates(maximum: maximum ?? this.maximum, minimum: minimum ?? this.minimum);

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
    maximum: DateTime.tryParse(json["maximum"] ?? '') ?? DateTime(1970, 1, 1),
    minimum: DateTime.tryParse(json["minimum"] ?? '') ?? DateTime(1970, 1, 1),
  );

  Map<String, dynamic> toJson() => {
    "maximum":
        "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
    "minimum":
        "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
  };
}
