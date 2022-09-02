part of 'movie_informations_cubit.dart';

@immutable
abstract class MovieInformationsState {}

class MovieInformationsInitial extends MovieInformationsState {}
class MovieInformationsLoading extends MovieInformationsState {}

class MovieInformationsLoaded extends MovieInformationsState {
  List data;
  MovieInformationsLoaded(this.data);
}

class MovieInformationsFailure extends MovieInformationsState {}
