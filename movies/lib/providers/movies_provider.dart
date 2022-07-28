import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/models.dart';

import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '846eeb2a662318c46ad000b08cdd7c98';
  final String _language = 'en-US';
  late List<Movie> onDisplayMovies = [];
  late List<Movie> popularMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    if (response.statusCode != 200) {
      return print('Error');
    }
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    if (response.statusCode != 200) {
      return print('Error');
    }
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
