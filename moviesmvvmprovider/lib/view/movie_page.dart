import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesmvvmprovider/view/widgets/movie_item.dart';
import 'package:moviesmvvmprovider/viewmodel/movie_list_viewmodel.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MoviePage();
}

class _MoviePage extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchTextController = TextEditingController();
    final movieListViewModel = Provider.of<MovieListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 4),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 48,
                  child: TextField(
                    controller: _searchTextController,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        movieListViewModel.movies.clear();
                        movieListViewModel.fetchMovies(value);
                        _searchTextController.clear();
                      }
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Enter movie name to search',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                )),
            FutureBuilder(
              future:
                  movieListViewModel.fetchMovies(_searchTextController.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (movieListViewModel.movies.isNotEmpty) {
                    return Expanded(
                        child: MovieItem(
                      movies: movieListViewModel.movies,
                    ));
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Container(
                    padding: EdgeInsets.only(top: 16),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return Expanded(
                    child: Center(
                  child: Text(
                    'MOVIE NOT FOUND!',
                    style: TextStyle(color: Colors.red),
                  ),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
