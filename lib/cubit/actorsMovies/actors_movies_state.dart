part of 'actors_movies_cubit.dart';


abstract class ActorsMoviesState {}

class ActorsMoviesInitial extends ActorsMoviesState {}

class ActorsMoviesLoading extends ActorsMoviesState {}

class ActorsMoviesLoaded extends ActorsMoviesState {
  ActorMovies? data;
  ActorsMoviesLoaded(this.data);
}

class ActorsMoviesFailure extends ActorsMoviesState {}
