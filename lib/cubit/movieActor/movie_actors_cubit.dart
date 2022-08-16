import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:movie_app/model/actorData_model.dart';
import 'package:movie_app/service/movieService.dart';

part 'movie_actors_state.dart';

class MovieActorsCubit extends Cubit<MovieActorsState> {
    MovieService movieservice;

  MovieActorsCubit(
    this.movieservice,
  ) : super(MovieActorsInitial());
   Future<void> getmovieActors(String movieId) async {
    emit(MovieActorsLoading());
    try {
      ActorData? actorsData = await movieservice.getMovieCredits(movieId);
      emit(MovieActorsLoaded(actorsData!));
    } on Exception catch (e) {
      emit(MovieActorsFailure());
    }
  }
}
