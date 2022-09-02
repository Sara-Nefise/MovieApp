import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:movie_app/feature/movieDetailPage/view/detailScreen.dart';

class movieCard extends StatelessWidget {
  dynamic movieModel;
  movieCard({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String Url = "https://image.tmdb.org/t/p/w500${movieModel?.posterPath}";
    return Hero(
      tag: '${movieModel?.id}',
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(result: movieModel)),
          );
        },
        child: movieModel?.posterPath != null
            ? Container(
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: context.normalBorderRadius,
                    image: DecorationImage(
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.cover,
                        image: NetworkImage(Url))),
                child: Stack(children: [_rateContainer(context)]),
              )
            : Container(
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  color: AppColors().grey,
                  borderRadius: context.normalBorderRadius,
                )),
      ),
    );
  }

  Positioned _rateContainer(BuildContext context) {
    return Positioned(
        left: 25,
        top: 20,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: context.lowBorderRadius, color: AppColors().red),
          width: context.dynamicWidth(0.1),
          height: context.dynamicHeight(0.032),
          child: Text(
            '${movieModel?.voteAverage.toStringAsFixed(1)}',
            style: context.textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
