part of 'similar_movies_cubit.dart';

@immutable
abstract class SimilarMoviesState {}

class SimilarMoviesInitial extends SimilarMoviesState {}
class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesLoaded extends SimilarMoviesState {
  SimilarMovies? data;
  SimilarMoviesLoaded(this.data);
}

class SimilarMoviesFailure extends SimilarMoviesState {}
