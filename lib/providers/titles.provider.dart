import 'dart:convert';

import 'package:film_inspector/models/title.model.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class TitleProvider {

  Future<List<TitleModel>> homeProvider({required String tipo}) async {
    List<TitleModel> titles = [];
    var client = http.Client();

    try {
      Map<String, String> parametros = {
        'apiKey': apiKey,
      };
      var response =
          await http.get(Uri.https('imdb-api.com', 'es/API/$tipo', parametros));
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      decodedResponse['items']
          .forEach((item) => titles.add(TitleModel.fromJson(item)));
      return titles;
    } finally {
      client.close();
    }
  }

  Future<String> trailerMovie(String id) async {
    String videoURl = '';
    var client = http.Client();
    try {
      Map<String, String> parametros = {
        'apiKey': apiKey,
        'id' : id
      };
      var response =
          await http.get(Uri.https('imdb-api.com', 'API/YouTubeTrailer', parametros));
      var decodedResponse =jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      videoURl = decodedResponse['videoUrl']?? 'https://www.youtube.com/watch?v=ts8i-6AtDfc';
      return videoURl;
    } finally {
      client.close();
    }
  }

   Future<TitleModel> movieById(String id) async {
    TitleModel title;
    var client = http.Client();
    try {
      Map<String, String> parametros = {
        'apiKey': apiKey,
        'id' : id
      };
      print(Uri.https('imdb-api.com', 'es/API/Title', parametros));
      var response =
          await http.get(Uri.https('imdb-api.com', 'es/API/Title', parametros));
      print(response);
      var decodedResponse =jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      print(decodedResponse);
      title = TitleModel.fromJson(decodedResponse);
      return title;
    } finally {
      client.close();
    }
  }

  Future<List<TitleModel>> searchProvider({required String title, required String type, required String genre, required String certificates}) async {
    List<TitleModel> titles = [];
    var client = http.Client();
    try {
      Map<String, String> parametros = {
        'apiKey': apiKey,
        'title': title,
        'title_type': type,
        'genres': genre,
        'certificates': certificates
      };
      print(Uri.https('imdb-api.com', 'es/API/AdvancedSearch', parametros));
      var response =
          await http.get(Uri.https('imdb-api.com', 'es/API/AdvancedSearch', parametros));
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      decodedResponse['results']
          .forEach((item) => titles.add(TitleModel.fromJson(item)));
      return titles;
    } finally {
      client.close();
    }
  }

  
}
