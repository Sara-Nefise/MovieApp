import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:movie_app/model/similarMovies.dart';
import 'package:movie_app/service/movieService.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
    MovieService movieservice;

  SimilarMoviesCubit(
    this.movieservice,
  ) : super(SimilarMoviesInitial());

  Future<void> getSimilarMovies(String personId) async {
    emit(SimilarMoviesLoading());
    try {
      SimilarMovies? movieData = await movieservice.getSimilarVideos(personId);
      emit(SimilarMoviesLoaded(movieData!));
    } on Exception {
      emit(SimilarMoviesFailure());
    }
  }

}
