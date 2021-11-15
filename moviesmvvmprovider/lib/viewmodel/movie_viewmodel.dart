import 'package:moviesmvvmprovider/model/movie.dart';

class MovieViewModel {
  final Movie movie;

  MovieViewModel({required this.movie});

  String get title {
    return this.movie.title;
  }

  String get year{
    return this.movie.year;
  }

  String get poster {
    return this.movie.poster;
  }

}
