import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/constant/appImages.dart';
import 'package:movie_app/core/constant/appStrings.dart';
import 'package:movie_app/core/cubit/cubit/network_cubit.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:movie_app/feature/movieDetailPage/view/detailScreen.dart';
import 'package:movie_app/feature/seeAllPage/seeAllPage.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';
import 'package:movie_app/products/widgets/movieList.dart';

import '../../../core/cubit/populerMovie/movie_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  AppStrings appStrings = AppStrings();
  AppImage appImages = AppImage();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NetworkCubit>(context).checkConnection();
    return SafeArea(child:
        BlocBuilder<NetworkCubit, NetworkState>(builder: (context, state) {
      if (state is NetworkSuccess) {
        return _homePage(context);
      } else {
        return Scaffold(
            body: lostConnetion(appImages: appImages, appStrings: appStrings));
      }
    }));
  }

  Row _movieListTitle(BuildContext context, Movie? populerMovie, String title) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: context.textTheme.headline5,
      ),
      _showAllMovies(context, populerMovie, title)
    ]);
  }

  TextButton _showAllMovies(
      BuildContext context, Movie? populerMovie, String title) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SeeAllPage(
                        movieCount: populerMovie?.results?.length,
                        movieData: populerMovie?.results,
                        appTitle: title,
                      )));
        },
        child: Text(appStrings.seeAllText,
            style: context.textTheme.headline5?.copyWith(
              color: AppColors().red,
            )));
  }

  _homePage(BuildContext context) {
    BlocProvider.of<MovieCubit>(context).getMovieLists();

    return SingleChildScrollView(
        padding: context.paddingNormal,
        child: BlocBuilder<MovieCubit, MoiveState>(builder: (context, state) {
          if (state is MovieFailure) {
            return lostConnetion(appImages: appImages, appStrings: appStrings);
          } else if (state is MovieLoaded) {
            Movie? populerMovie = state.movieData?[0];
            Movie? upComingMovie = state.movieData?[1];
            Movie? topRatedMovie = state.movieData?[2];
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _movieListTitle(
                      context, populerMovie, appStrings.populerListText),
                  MovieList(movie: populerMovie?.results),
                  _movieListTitle(
                      context, upComingMovie, appStrings.upCommingListText),
                  MovieList(movie: upComingMovie?.results),
                  _movieListTitle(
                      context, topRatedMovie, appStrings.topRatedListText),
                  MovieList(movie: topRatedMovie?.results),
                ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
