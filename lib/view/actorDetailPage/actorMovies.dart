import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/cubit/cubit/actors_movies_cubit.dart';
import 'package:movie_app/widgets/movieCard.dart';

class ActorMoviesScreen extends StatelessWidget {
  String actorId;
  ActorMoviesScreen({
    Key? key,
    required this.actorId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ActorsMoviesCubit>(context).getActorMovies(actorId);
    return BlocBuilder<ActorsMoviesCubit, ActorsMoviesState>(
        builder: (context, state) {
      if (state is ActorsMoviesLoading) {
        return const CircularProgressIndicator();
      } else if (state is ActorsMoviesFailure) {
        return const Text('state error');
      } else if (state is ActorsMoviesLoaded) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.data?.cast?.length,
                itemBuilder: (context, index) {
                  return movieCard(
                    movieModel: state.data?.cast?[index],
                  );
                }));
      } else {
        return Center(
          child: Text('initial'),
        );
      }
    });
  }
}
