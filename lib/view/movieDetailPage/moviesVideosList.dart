import 'package:flutter/material.dart';
import 'package:movie_app/model/movieVideos_model.dart';

import 'package:movie_app/model/similarMovies.dart';
import 'package:movie_app/view/movieDetailPage/moviesVideos.dart';

class MoviesVideoList extends StatelessWidget {
  MovieVideos? movieVideos;
  MoviesVideoList({
    Key? key,
    required this.movieVideos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: movieVideos?.results?.length ?? 0,
      itemBuilder: (context, index) {
        return MovieVideo(
          results: movieVideos?.results?[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.grey,
        thickness: 1.5,
      ),
    );
  }
}
