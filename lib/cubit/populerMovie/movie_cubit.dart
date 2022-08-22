import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/service/movieService.dart';
part 'movie_state.dart';

class MovieCubit extends Cubit<MoiveState> {
  MovieService movieservice;
  MovieCubit(
    this.movieservice,
  ) : super(MovieInitial());

  Future<void> getMovieLists() async {
    emit(MovieLoading());
    try {
      List? movieData = await movieservice.getMovieLists();
      emit(MovieLoaded(movieData));
    } on Exception {
      emit(MovieFailure());
    }
  }
}
