import 'dart:convert';
import 'movie_moviedb.dart';

MovieDbResponse movieDbResponseFromJson(String str) => MovieDbResponse.fromJson(json.decode(str));

String movieDbResponseToJson(MovieDbResponse data) => json.encode(data.toJson());

class MovieDbResponse {
    Dates? dates;
    int page;
    List<MovieMovieDB> MovieMovieDBs;
    int totalPages;
    int totalMovieMovieDBs;

    MovieDbResponse({
        required this.dates,
        required this.page,
        required this.MovieMovieDBs,
        required this.totalPages,
        required this.totalMovieMovieDBs,
    });

    factory MovieDbResponse.fromJson(Map<String, dynamic> json) => MovieDbResponse(
        dates: json["dates"] != null? Dates.fromJson(json["dates"]) : null,
        page: json["page"],
        MovieMovieDBs: List<MovieMovieDB>.from(json["results"].map((x) => MovieMovieDB.fromJson(x))),
        totalPages: json["total_pages"],
        totalMovieMovieDBs: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "dates": dates == null ? null : dates!.toJson(),
        "page": page,
        "MovieMovieDBs": List<dynamic>.from(MovieMovieDBs.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_MovieMovieDBs": totalMovieMovieDBs,
    };
}

class Dates {
    DateTime maximum;
    DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}

