import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final String title;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  Movie({
    this.backdropPath,
    this.id,
    this.title,
  });

  static final URL = "https://image.tmdb.org/t/p/w500";

  String get backDropUrl {
    if (backdropPath == null) {
      return '';
    }

    return URL + backdropPath;
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
