part of 'movie_cubit.dart';

abstract class MoiveState {}

class MovieInitial extends MoiveState {}

class MovieLoading extends MoiveState {}

class MovieLoaded extends MoiveState {
  populerMovie movieData;
  MovieLoaded(
    this.movieData,
  );
}

class MovieFailure extends MoiveState {}
