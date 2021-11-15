import 'package:flutter/cupertino.dart';
import 'package:moviesmvvmprovider/model/services/api_service.dart';
import 'package:moviesmvvmprovider/viewmodel/movie_viewmodel.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = <MovieViewModel>[];

  Future<void> fetchMovies(String keyword) async {
    final result = await MovieService().fetchMovies(keyword);
    this.movies = result.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }
}
