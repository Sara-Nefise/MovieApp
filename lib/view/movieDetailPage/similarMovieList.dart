import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/similarMovies.dart';

import 'package:movie_app/widgets/movieCard.dart';

class SimilarMovieList extends StatelessWidget {
  SimilarMovies? similarMovies;

  SimilarMovieList({
    Key? key,
    required this.similarMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GridView.builder(
        itemCount: similarMovies?.results?.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: movieCard(
              movieModel: similarMovies?.results?[index],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20),
      ),
    );
  }
}
