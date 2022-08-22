import 'package:flutter/material.dart';

import 'package:movie_app/widgets/movieCard.dart';
import 'package:kartal/kartal.dart';

class SeeAllPage extends StatelessWidget {
  int? movieCount;
  var movieData;
  SeeAllPage({
    Key? key,
    required this.movieCount,
    required this.movieData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView.builder(
            padding: context.paddingNormal,
            itemCount: movieCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 20,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.6)),
            itemBuilder: (BuildContext context, int index) {
              return movieCard(
                movieModel: movieData[index],
              );
            }));
  }
}
