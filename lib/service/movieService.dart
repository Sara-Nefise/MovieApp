import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/apiConstants.dart';
import 'package:movie_app/model/actorData_model.dart';
import 'package:movie_app/model/actorPersonalInfo_model.dart';
import 'package:movie_app/model/actorsMovie_model.dart';
import 'package:movie_app/model/movieVideos_model.dart';
import 'package:movie_app/model/populerMovie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/similarMovies.dart';

class MovieService {
  Future<populerMovie?> getPopulerMovies() async {
    try {
      var uri = Uri.parse(ApiConstants.populerMovieUrl);
      final response = await http.get(uri);
      print('${response.statusCode}');
      if (response.statusCode == 200) {
        populerMovie? model = populerMovie.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
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
    ActorMovies? actorMovies = ActorMovies.fromJson(jsonDecode(results[1].body));
    // if (results.statusCode == 200) {

    //   return model;
    // }
    return [actorInfo, actorMovies];
  }


}
