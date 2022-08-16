import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/init/theme/app_theme.dart';
import 'package:movie_app/cubit/actorPersonalInfo/actor_personal_info_cubit.dart';
import 'package:movie_app/cubit/cubit/actors_movies_cubit.dart';
import 'package:movie_app/cubit/movieActor/movie_actors_cubit.dart';
import 'package:movie_app/cubit/populerMovie/movie_cubit.dart';
import 'package:movie_app/service/movieService.dart';
import 'package:movie_app/view/home/populerMovieList/populerMovie_list.dart';
import 'package:movie_app/view/onboard/onboardScreen.dart';
import 'package:movie_app/view/signIn/signInScreen.dart';
import 'package:movie_app/view/splash/splashScreen.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

void main() {
  runApp(MyApp());
}

@WidgetbookDeviceFrameBuilder()
DeviceFrameBuilderFunction frameBuilder = (
  BuildContext context,
  Device device,
  WidgetbookFrame frame,
  Orientation orientation,
  Widget child,
) {
  if (frame == WidgetbookFrame.defaultFrame()) {
    return WidgetbookDeviceFrame(
      orientation: orientation,
      device: device,
      child: child,
    );
  }

  if (frame == WidgetbookFrame.deviceFrame()) {
    final deviceInfo = mapDeviceToDeviceInfo(device);
    return DeviceFrame(
      orientation: orientation,
      device: deviceInfo,
      screen: child,
    );
  }
  return child;
};
@WidgetbookScaffoldBuilder()
ScaffoldBuilderFunction scaffoldBuilder = (
  BuildContext context,
  WidgetbookFrame frame,
  Widget child,
) {
  if (frame.allowsDevices) {
    return Scaffold(
      body: child,
    );
  }
  return child;
};

@WidgetbookThemeBuilder()
ThemeBuilderFunction<CustomTheme> themeBuilder<CustomTheme>() => (
      BuildContext context,
      CustomTheme theme,
      Widget child,
    ) {
      if (theme is ThemeData) {
        return Theme(
          data: theme,
          child: child,
        );
      }
      if (theme is CupertinoThemeData) {
        return CupertinoTheme(
          data: theme,
          child: child,
        );
      }

      throw Exception(
        'You are using Widgetbook with custom theme data. '
        'Please provide an implementation for themeBuilder.',
      );
    };

@WidgetbookApp.material(
  name: 'Movie App',
  frames: const [
    WidgetbookFrame(
      name: 'Widgetbook',
      allowsDevices: true,
    ),
    WidgetbookFrame(
      name: 'None',
      allowsDevices: false,
    ),
  ],
  devices: [Apple.iPhone12, Samsung.s10],
  textScaleFactors: [
    1,
    2,
    3,
  ],
  foldersExpanded: true,
  widgetsExpanded: true,
)
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
        BlocProvider(create: (_) => ActorsMoviesCubit(movieservice))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: createTheme(AppThemeLight()),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/onboard': (context) => OnboardScreen(),
          '/login': (context) => SignInScreen(),
          '/home': (context) => PopulerMovie(),
          //'/detail':(context) => DetailScreen()
        },
      ),
    );
  }
}
