import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_project/latihan/latihan40/latihan35/model/popular_movies.dart';

class ApiProvider {
  final String apiKey = '0fc5740199faa75da813c8c97f659e8';
  final String baseUrl = 'y';

  Future<PopularMovies> getPopularMovies() async {
    final Uri url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
  }
}
