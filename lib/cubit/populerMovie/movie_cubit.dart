import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/model/populerMovie_model.dart';
import 'package:movie_app/service/movieService.dart';
part 'movie_state.dart';

class MovieCubit extends Cubit<MoiveState> {
  MovieService movieservice;
  MovieCubit(
    this.movieservice,
  ) : super(MovieInitial());

  Future<void> getPopulerMovies() async {
    emit(MovieLoading());
    try {
      populerMovie? movieData = await movieservice.getPopulerMovies();
      emit(MovieLoaded(movieData!));
    } on Exception {
      emit(MovieFailure());
    }
  }

 
}
