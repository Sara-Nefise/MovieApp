import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';

import 'package:movie_app/cubit/moviesVideos/movies_videos_cubit.dart';
import 'package:movie_app/view/movieDetailPage/moviesVideos.dart';

class MoviesVideoList extends StatelessWidget {
  String movieId;
  MoviesVideoList({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviesVideosCubit>(context).getmovieVideos(movieId);

    return BlocBuilder<MoviesVideosCubit, MoviesVideosState>(
        builder: (context, state) {
      if (state is MoviesVideosLoading) {
        return const CircularProgressIndicator();
      } else if (state is MoviesVideosFailure) {
        return const Text('state error');
      } else if (state is MoviesVideosLoaded) {
        return ListView.separated(
          itemCount: state.videoData?.results?.length ?? 0,
          itemBuilder: (context, index) {
            return MovieVideo(
              results: state.videoData?.results?[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.grey,
            thickness: 1.5,
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
