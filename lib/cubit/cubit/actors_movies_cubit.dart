
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/actorsMovie_model.dart';
import 'package:movie_app/service/movieService.dart';

part 'actors_movies_state.dart';

class ActorsMoviesCubit extends Cubit<ActorsMoviesState> {
  MovieService movieservice;

  ActorsMoviesCubit(
    this.movieservice,
  ) : super(ActorsMoviesInitial());
  Future<void> getActorMovies(String personId) async {
    emit(ActorsMoviesLoading());
    try {
      ActorMovies? movieData = await movieservice.getActorsMovies(personId);
      emit(ActorsMoviesLoaded(movieData!));
    } on Exception catch (e) {
      emit(ActorsMoviesFailure());
    }
  }
}
