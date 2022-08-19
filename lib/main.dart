import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/init/theme/app_theme.dart';
import 'package:movie_app/cubit/actorPersonalInfo/actor_personal_info_cubit.dart';
import 'package:movie_app/cubit/actorsMovies/actors_movies_cubit.dart';
import 'package:movie_app/cubit/movieActor/movie_actors_cubit.dart';
import 'package:movie_app/cubit/moviesVideos/movies_videos_cubit.dart';
import 'package:movie_app/cubit/populerMovie/movie_cubit.dart';
import 'package:movie_app/service/movieService.dart';
import 'package:movie_app/view/home/populerMovieList/populerMovie_list.dart';
import 'package:movie_app/view/onboard/onboardScreen.dart';
import 'package:movie_app/view/signIn/signInScreen.dart';
import 'package:movie_app/view/splash/splashScreen.dart';

import 'cubit/cubit/similar_movies_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  MovieService movieservice = MovieService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MovieCubit(movieservice)),
        BlocProvider(create: (_) => MovieActorsCubit(movieservice)),
        BlocProvider(create: (_) => ActorPersonalInfoCubit(movieservice)),
        BlocProvider(create: (_) => ActorsMoviesCubit(movieservice)),
        BlocProvider(create: (_) => MoviesVideosCubit(movieservice)),
        BlocProvider(create: (_) => SimilarMoviesCubit(movieservice))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: createTheme(AppThemeLight()),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/onboard': (context) => const OnboardScreen(),
          '/login': (context) => const SignInScreen(),
          '/home': (context) => const PopulerMovie(),
          //'/detail':(context) => DetailScreen()
        },
      ),
    );
  }
}
