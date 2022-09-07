import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/cubit/cubit/network_cubit.dart';
import 'package:movie_app/core/init/theme/app_theme.dart';
import 'package:movie_app/core/service/movieService.dart';
import 'package:movie_app/feature/home/view/homeScreen.dart';
import 'package:movie_app/feature/onboard/onboardScreen.dart';
import 'package:movie_app/feature/splash/splashScreen.dart';

import 'core/cubit/ActorInfo/actor_info_cubit.dart';
import 'core/cubit/MovieInfo_cubit/movie_informations_cubit.dart';
import 'core/cubit/populerMovie/movie_cubit.dart';

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
        BlocProvider(create: (_) => MovieInformationsCubit(movieservice)),
        BlocProvider(create: (_) => ActorInfoCubit(movieservice)),
        BlocProvider(create: (_) => NetworkCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: createTheme(AppThemeLight()),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/onboard': (context) => OnboardScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
