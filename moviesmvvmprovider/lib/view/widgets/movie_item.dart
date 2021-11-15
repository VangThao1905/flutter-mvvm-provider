import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesmvvmprovider/view/detail_movie.dart';
import 'package:moviesmvvmprovider/viewmodel/movie_viewmodel.dart';

class MovieItem extends StatelessWidget {
  final List<MovieViewModel> movies;

  MovieItem({required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = this.movies[index];
          return ListTile(
            isThreeLine: true,
            contentPadding: EdgeInsets.all(10),
            leading: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(movie.poster)),
                  borderRadius: BorderRadius.circular(10)),
              width: 96,
              height: 120,
            ),
            title: Text(
              movie.title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              print('tap on:${movie.title}');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailMovie(
                            movie: movie.movie,
                          )));
            },
            subtitle: Text("Year:${movie.year}"),
          );
        });
  }
}
