import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:movie_app/service/movieService.dart';

part 'movie_informations_state.dart';

class MovieInformationsCubit extends Cubit<MovieInformationsState> {
      MovieService movieservice;

  MovieInformationsCubit(
    this.movieservice,
  ) : super(MovieInformationsInitial());
  
  Future<void> getMovieInfo(String movieId) async {
    emit(MovieInformationsLoading());
    try {
      var movieData = await movieservice.getMovieInfo(movieId);
      emit(MovieInformationsLoaded(movieData));
    } on Exception {
      emit(MovieInformationsFailure());
    }
  }
}
