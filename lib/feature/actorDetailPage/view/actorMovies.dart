import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/feature/movieDetailPage/model/actorsMovie_model.dart';
import 'package:movie_app/products/widgets/movieCard.dart';

class ActorMoviesScreen extends StatelessWidget {
  ActorMovies? actorMovies;
  ActorMoviesScreen({
    Key? key,
    required this.actorMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: actorMovies?.cast?.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.only(left: index == 0 ? 0 : 15),
                  child: movieCard(
                    movieModel: actorMovies?.cast?[index],
                  ));
            }));
  }
}
