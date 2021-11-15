import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesmvvmprovider/model/movie.dart';

class DetailMovie extends StatelessWidget {
  final Movie movie;

  DetailMovie({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail movie')),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: movie.poster,
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),

        ],
      )
    );
  }
}
