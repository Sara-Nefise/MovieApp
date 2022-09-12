import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:movie_app/products/widgets/movieCard.dart';

class SeeAllPage extends StatelessWidget {
  int? movieCount;
  var movieData;
  String appTitle;
  SeeAllPage({
    Key? key,
    required this.movieCount,
    required this.movieData,
    required this.appTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            appTitle,
            style: context.textTheme.headline5,
          ),
          centerTitle: true,
        ),
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
