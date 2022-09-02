import 'package:flutter/material.dart';
import 'package:movie_app/feature/movieDetailPage/model/similarMovies.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/products/widgets/movieCard.dart';

class SimilarMovieList extends StatelessWidget {
  SimilarMovies? similarMovies;

  SimilarMovieList({
    Key? key,
    required this.similarMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: GridView.builder(
        itemCount: similarMovies?.results?.length,
        itemBuilder: (BuildContext context, int index) {
          return movieCard(
            movieModel: similarMovies?.results?[index],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 20,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.5)),
      ),
    );
  }
}
