import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/model/movieVideos_model.dart';

import 'package:movie_app/service/movieService.dart';

part 'movies_videos_state.dart';

class MoviesVideosCubit extends Cubit<MoviesVideosState> {
  MovieService movieservice;

  MoviesVideosCubit(
    this.movieservice,
  ) : super(MoviesVideosInitial());

     Future<void> getmovieVideos(String movieId) async {
    emit(MoviesVideosLoading());
    try {
      MovieVideos? videoData = await movieservice.getMoviesVideos(movieId);
      emit(MoviesVideosLoaded(videoData!));
    } on Exception {
      emit(MoviesVideosFailure());
    }
  }
}
