import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:moviesmvvmprovider/model/movie.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://www.omdbapi.com/";
const apiKey = "6d5fc0a4";

class MovieService {
  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = baseUrl + "?s=$keyword&apiKey=$apiKey";
    final movieResponse = await http.get(Uri.parse(url));

    print("debug here");
    if (movieResponse.statusCode == 200) {
      final movieBody = jsonDecode(movieResponse.body);
      final Iterable json = movieBody["Search"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Unable to perform request!');
    }

  }
}
