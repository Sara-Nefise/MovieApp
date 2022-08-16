import 'dart:convert';
import 'dart:developer';

import 'package:movie_app/core/constant/apiConstants.dart';
import 'package:movie_app/model/actorData_model.dart';
import 'package:movie_app/model/actorPersonalInfo_model.dart';
import 'package:movie_app/model/actorsMovie_model.dart';
import 'package:movie_app/model/populerMovie_model.dart';
import 'package:http/http.dart' as http;

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
  }

  Future<ActorData?> getMovieCredits(String movieId) async {
    try {
      var uri = Uri.parse(ApiConstants().movieCasts(movieId));
      final response = await http.get(uri);
      print('${response.statusCode}');
      if (response.statusCode == 200) {
        ActorData? model = ActorData.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<ActorPersonalInfo?> getActorsInfo(String personId) async {
    try {
      var uri = Uri.parse(ApiConstants().actorsInfo(personId));
      final response = await http.get(uri);
      print('${response.statusCode}');
      if (response.statusCode == 200) {
        ActorPersonalInfo? model =
            ActorPersonalInfo.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<ActorMovies?> getActorsMovies(String personId) async {
    try {
      var uri = Uri.parse(ApiConstants().actorMovies(personId));
      final response = await http.get(uri);
      print('${response.statusCode}');
      if (response.statusCode == 200) {
        ActorMovies? model = ActorMovies.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
