part of 'movie_actors_cubit.dart';

@immutable
abstract class MovieActorsState {}

class MovieActorsInitial extends MovieActorsState {}

class MovieActorsLoading extends MovieActorsState {}

class MovieActorsLoaded extends MovieActorsState {
  ActorData? actorData;
  MovieActorsLoaded(this.actorData);
}

class MovieActorsFailure extends MovieActorsState {}
