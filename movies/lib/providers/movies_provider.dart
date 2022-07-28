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
  int _popularPage = 0;
  Map<int, List<Cast>> moviesCast = {};

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieID) async {
    if (moviesCast.containsKey(movieID)) {
      return moviesCast[movieID]!;
    }
    final jsonData = await _getJsonData('3/movie/$movieID/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    moviesCast[movieID] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
