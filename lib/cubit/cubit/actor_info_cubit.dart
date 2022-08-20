import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/service/movieService.dart';

part 'actor_info_state.dart';

class ActorInfoCubit extends Cubit<ActorInfoState> {
  MovieService movieService;
  ActorInfoCubit(
    this.movieService,
  ) : super(ActorInfoInitial());

  Future<void> getMovieInfo(String personId) async {
    emit(ActorInfoLoading());
    try {
      var movieData = await movieService.getActorsInfo(personId);
      emit(ActorInfoLoaded(movieData));
    } on Exception {
      emit(ActorInfoFailure());
    }
  }
}
