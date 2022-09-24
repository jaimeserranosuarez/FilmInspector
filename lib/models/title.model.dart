import 'package:flutter/widgets.dart';

class TitleModel{
  String rank;
  String id;
  String title;
  String originalTitle;
  String fullTitle;
  String image;
  String type;
  String year;
  String releaseDate;
  String runtimeStr;
  String plot;
  String plotLocal;
  String awards;
  String directors;
  String genres;
  String imDbRating;

  TitleModel({
    required this.rank,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.fullTitle,
    required this.image,
    required this.type,
    required this.year,
    required this.releaseDate,
    required this.runtimeStr,
    required this.plot,
    required this.plotLocal,
    required this.awards,
    required this.directors,
    required this.genres,
    required this.imDbRating,

  });

  TitleModel.emptyTitle({this.rank = "", this.id = "", this.title = "", this.originalTitle = "", this.fullTitle = "", this.image = "", this.type = "", this.year = "", this.releaseDate = "", this.runtimeStr = "", this.plot = "", this.plotLocal = "", this.awards = "", this.directors = "", this.genres = "", this.imDbRating = ""});

  factory TitleModel.fromJson(Map<String, dynamic> json) => TitleModel(
      rank: json['rank'] ?? '',
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      originalTitle: json['originalTitle'] ?? '',
      fullTitle: json['fullTitle'] ?? '',
      image: json['image'] ?? '',
      type: json['type'] ?? '',
      year: json['year'] ?? '',
      releaseDate: json['releaseDate'] ?? '',
      runtimeStr: json['runtimeStr'] ?? '',
      plot: json['plot'] ?? '',
      plotLocal: json['plotLocal'] ?? '',
      awards: json['awards'] ?? '',
      directors: json['directors'] ?? '',
      genres: json['genres'] ?? '',
      imDbRating: json['imDbRating'] ?? '',
      );
}
