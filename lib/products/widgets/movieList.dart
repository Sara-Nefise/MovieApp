import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';
import 'package:movie_app/products/widgets/movieCard.dart';


class MovieList extends StatelessWidget {
  List<Results>? movie;

   MovieList({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        height: MediaQuery.of(context).size.height * 0.32,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: index == 0 ? 0 : 15),
                child: movieCard(
                  movieModel: movie?[index],
                ),
              );
            }));
  }
}
