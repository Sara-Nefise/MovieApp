import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/cubit/similar_movies_cubit.dart';
import 'package:movie_app/widgets/movieCard.dart';

class SimilarMovieList extends StatelessWidget {
  String movieId;

  SimilarMovieList({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SimilarMoviesCubit>(context).getSimilarMovies(movieId);

    return BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
        builder: (context, state) {
      if (state is SimilarMoviesLoading) {
        return const CircularProgressIndicator();
      } else if (state is SimilarMoviesFailure) {
        return const Text('state error');
      } else if (state is SimilarMoviesLoaded) {
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: GridView.builder(
            itemCount: state.data?.results?.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: movieCard(
                  movieModel: state.data?.results?[index],
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20),
          ),
        );
      } else {
        return const Center(
          child: Text('initial'),
        );
      }
    });
  }
}
