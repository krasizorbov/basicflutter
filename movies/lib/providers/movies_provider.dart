import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '846eeb2a662318c46ad000b08cdd7c98';
  final String _language = 'en-US';

  MoviesProvider() {
    print('From movies provider');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    if (response.statusCode != 200) {
      return print('Error');
    }
    print(response.body);
  }
}
