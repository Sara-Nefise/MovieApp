import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:movie_app/model/actorPersonalInfo_model.dart';
import 'package:movie_app/service/movieService.dart';

part 'actor_personal_info_state.dart';

class ActorPersonalInfoCubit extends Cubit<ActorPersonalInfoState> {
  MovieService movieservice;

  ActorPersonalInfoCubit(
    this.movieservice,
  ) : super(ActorPersonalInfoInitial());
  
  Future<void> getActorsInfo(String personId) async {
    emit(ActorPersonalInfoLoading());
    try {
      ActorPersonalInfo? actorsInfo = await movieservice.getActorsInfo(personId);
      emit(ActorPersonalInfoLoaded(actorsInfo!));
    } on Exception {
      emit(ActorPersonalInfoFailure());
    }
  }
}
