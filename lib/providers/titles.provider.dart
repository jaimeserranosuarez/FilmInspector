import 'dart:convert';

import 'package:film_inspector/models/title.model.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class TitleProvider {
  Future<List<TitleModel>> top250Movies() async {
    List<TitleModel> titles = [];
    var client = http.Client();

    try {
      Map<String, String> parametros = {
        'apiKey': 'k_lmr00sx7',
      };
      var response =
          await http.get(Uri.https('imdb-api.com', 'API/Top250Movies', parametros));

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
        'apiKey': 'k_lmr00sx7',
        'id' : id
      };
      var response =
          await http.get(Uri.https('imdb-api.com', 'API/YouTubeTrailer', parametros));
      var decodedResponse =jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      videoURl = decodedResponse['videoUrl'];
      return videoURl;
    } finally {
      client.close();
    }
  }

   Future<String> plotMovie(String id) async {
    String plotLocal = '';
    var client = http.Client();
    try {
      Map<String, String> parametros = {
        'apiKey': 'k_lmr00sx7',
        'id' : id
      };
      var response =
          await http.get(Uri.https('imdb-api.com', 'es/API/Title', parametros));
      var decodedResponse =jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      plotLocal = decodedResponse['plotLocal'];
      return plotLocal;
    } finally {
      client.close();
    }
  }

  
}
