part of 'movies_videos_cubit.dart';

@immutable
abstract class MoviesVideosState {}

class MoviesVideosInitial extends MoviesVideosState {}

class MoviesVideosLoaded extends MoviesVideosState {
  MovieVideos? videoData;
  MoviesVideosLoaded(this.videoData);
}

class MoviesVideosLoading extends MoviesVideosState {}

class MoviesVideosFailure extends MoviesVideosState {}
