import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/populerMovie/movie_cubit.dart';
import 'package:movie_app/widgets/movieCard.dart';

class PopulerMovie extends StatelessWidget {
  const PopulerMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MovieCubit>(context).getPopulerMovies();
    return Scaffold(
      body: BlocBuilder<MovieCubit, MoiveState>(builder: (context, state) {
        if (state is MovieLoading) {
          return const CircularProgressIndicator();
        } else if (state is MovieFailure) {
          return  const Text('state error');
        } else if (state is MovieLoaded) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.movieData.results?.length,
                  itemBuilder: (context, index) {
                    return movieCard(
                      movieModel:state.movieData.results?[index],
                        );
                  }));
        } else {
          return Center(
            child: Text('initial'),
          );
        }
      }),
    );
  }
}
