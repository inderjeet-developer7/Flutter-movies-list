import 'dart:convert';

MovieData movieDataFromJson(String str) => MovieData.fromJson(json.decode(str));

String movieDataToJson(MovieData data) => json.encode(data.toJson());

class MovieData {
  MovieData({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  int statusCode;
  String message;
  Data data;

  factory MovieData.fromJson(Map<String, dynamic> json) => MovieData(
    statusCode: json["status_code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.movies,
  });

  List<Movie> movies;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
  };
}

class Movie {
  Movie({
    required this.id,
    required this.name,
    required this.year,
    required this.director,
    required this.mainStar,
    required this.description,
    required this.favoritedByUsers,
    required this.genres,
    required this.thumbnail,
  });

  int id;
  String name;
  String year;
  String director;
  String mainStar;
  String description;
  int favoritedByUsers;
  List<String> genres;
  String thumbnail;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json["id"],
    name: json["name"],
    year: json["year"],
    director: json["director"],
    mainStar: json["main_star"],
    description: json["description"],
    favoritedByUsers: json["favorited_by_users"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "year": year,
    "director": director,
    "main_star": mainStar,
    "description": description,
    "favorited_by_users": favoritedByUsers,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "thumbnail": thumbnail,
  };
}
