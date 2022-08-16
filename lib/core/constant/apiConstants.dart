import 'package:movie_app/model/populerMovie_model.dart';

class ApiConstants {
  static String requestTokenUrl =
      'https://api.themoviedb.org/3/authentication/token/new?api_key=$apiKey';
  static String newSessionUrl =
      'https://api.themoviedb.org/3/authentication/session/new?api_key=$apiKey';
  static String apiKey = 'ee7fc18c7de75ec9f16cc319e57300a1';
  static String? requestKey;
  static String? sessionId;
  static String populerMovieUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1';
  static var photoBaseUrl = "https://image.tmdb.org/t/p/w500";
  String movieCasts(String movieId) {
    String path =
        'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey&language=en-US';
    return path;
  }

  String actorsInfo(String personId) {
    String path =
        'https://api.themoviedb.org/3/person/$personId?api_key=$apiKey&language=en-US';
    return path;
  }

  String actorMovies(String personId) {
    String path =
        'https://api.themoviedb.org/3/person/$personId/movie_credits?api_key=$apiKey&language=en-US';
    return path;
  }
}