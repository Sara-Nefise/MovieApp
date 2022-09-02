import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/apiConstants.dart';
import 'package:movie_app/feature/actorDetailPage/model/actorData_model.dart';
import 'package:movie_app/feature/actorDetailPage/model/actorPersonalInfo_model.dart';
import 'package:movie_app/feature/movieDetailPage/model/actorsMovie_model.dart';
import 'package:movie_app/feature/movieDetailPage/model/movieVideos_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/feature/home/model/movie_model.dart';
import 'package:movie_app/feature/movieDetailPage/model/similarMovies.dart';

class MovieService {
  Future<List> getMovieLists() async {
    try {
      final results = await Future.wait([
        http.get(Uri.parse(ApiConstants.populerMovieUrl)),
        http.get(Uri.parse(ApiConstants.upComingMovie)),
        http.get(Uri.parse(ApiConstants.topRatedMovie)),
      ]);
      List<Movie?> populerMovie = [];

      if (results[0].statusCode == 200) {
        populerMovie.add(Movie.fromJson(jsonDecode(results[0].body)));
        if (results[1].statusCode == 200) {
          populerMovie.add(Movie.fromJson(jsonDecode(results[1].body)));
          if (results[2].statusCode == 200) {
            populerMovie
                .add(Movie.fromJson(jsonDecode(results[2].body)));
            return populerMovie;
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<List> getMovieInfo(String movieId) async {
    final results = await Future.wait([
      http.get(Uri.parse(ApiConstants().movieCasts(movieId))),
      http.get(Uri.parse(ApiConstants().moviesVideos(movieId))),
      http.get(Uri.parse(ApiConstants().similarMovies(movieId)))
    ]);
    ActorData? actors = ActorData.fromJson(jsonDecode(results[0].body));
    MovieVideos? videos = MovieVideos.fromJson(jsonDecode(results[1].body));
    SimilarMovies? similarMovies =
        SimilarMovies.fromJson(jsonDecode(results[2].body));
    // if (response.statusCode == 200) {

    //   return model;
    // }

    return [actors, videos, similarMovies];
  }

  Future<List> getActorsInfo(String personId) async {
    final results = await Future.wait([
      http.get(Uri.parse(ApiConstants().actorsInfo(personId))),
      http.get(Uri.parse(ApiConstants().actorMovies(personId))),
    ]);
    ActorPersonalInfo? actorInfo =
        ActorPersonalInfo.fromJson(jsonDecode(results[0].body));
    ActorMovies? actorMovies =
        ActorMovies.fromJson(jsonDecode(results[1].body));
    // if (results.statusCode == 200) {

    //   return model;
    // }
    return [actorInfo, actorMovies];
  }
}
