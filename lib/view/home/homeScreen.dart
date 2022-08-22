import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:movie_app/cubit/populerMovie/movie_cubit.dart';
import 'package:movie_app/model/populerMovie_model.dart';
import 'package:movie_app/view/home/populerMovieList/populerMovie_list.dart';
import 'package:movie_app/view/seeAllPage/seeAllPage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MovieCubit>(context).getMovieLists();

    return BlocBuilder<MovieCubit, MoiveState>(builder: (context, state) {
      if (state is MovieLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is MovieFailure) {
        return const Text('state error');
      } else if (state is MovieLoaded) {
        if (state.movieData?.length == 0) {
          return SafeArea(
              child: SingleChildScrollView(
                  padding: context.paddingNormal,
                  child: const Center(
                    child: Text('No Connection Found'),
                  )));
        } else {
          Movie? populerMovie = state.movieData?[0];
          Movie? upComingMovie = state.movieData?[1];
          Movie? topRatedMovie = state.movieData?[2];

          return SafeArea(
              child: SingleChildScrollView(
                  padding: context.paddingNormal,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _movieListTitle(
                            context, populerMovie, 'Popular Film List'),
                        PopulerMovieList(movie: populerMovie?.results),
                        _movieListTitle(
                            context, upComingMovie, 'Up Comming Film List'),
                        PopulerMovieList(movie: upComingMovie?.results),
                        _movieListTitle(
                            context, topRatedMovie, 'Top Rated Film List'),
                        PopulerMovieList(movie: topRatedMovie?.results),
                      ])));
        }
      } else {
        return const Center(
          child: Text('initial'),
        );
      }
    });
  }

  Row _movieListTitle(BuildContext context, Movie? populerMovie, String title) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: context.textTheme.headline5
            ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      _showAllMovies(context, populerMovie)
    ]);
  }

  TextButton _showAllMovies(BuildContext context, Movie? populerMovie) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SeeAllPage(
                        movieCount: populerMovie?.results?.length,
                        movieData: populerMovie?.results,
                      )));
        },
        child: Text('See all',
            style: context.textTheme.headline5?.copyWith(
                fontSize: 22,
                color: AppColors().red,
                fontWeight: FontWeight.bold)));
  }
}
