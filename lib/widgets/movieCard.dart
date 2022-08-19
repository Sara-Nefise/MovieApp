import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:movie_app/view/movieDetailPage/detailScreen.dart';

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
            ? Stack(children: [
                Container(
                  //margin: const EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * 0.42,
                  decoration: BoxDecoration(
                      borderRadius: context.normalBorderRadius,
                      image: DecorationImage(
                          filterQuality: FilterQuality.low,
                          fit: BoxFit.cover,
                          image: NetworkImage(Url))),
                ),
                _rateContainer(context)
              ])
            : Container(

                //margin: const EdgeInsets.only(left: 15),
                width: MediaQuery.of(context).size.width * 0.45,
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
          width: context.dynamicWidth(0.09),
          height: context.dynamicHeight(0.03),
          child: Text(
            '${movieModel?.voteAverage}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
