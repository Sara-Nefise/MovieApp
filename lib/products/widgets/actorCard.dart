import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:movie_app/feature/actorDetailPage/view/actorDetailScreen.dart';

import 'package:movie_app/feature/actorDetailPage/model/actorData_model.dart';

class ActorCard extends StatelessWidget {
  Cast? castData;

  ActorCard({
    Key? key,
    this.castData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String Url = "https://image.tmdb.org/t/p/w500${castData?.profilePath}";
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Hero(
        tag: '${castData?.id}',
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ActorDetailScreen(castData: castData)),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(Url),
                radius: 35,
              ),
              SizedBox(
                width: context.dynamicWidth(0.03),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    castData?.name ?? '',
                    style: context.textTheme.bodyText1?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                  ),
                  context.emptySizedHeightBoxLow,
                  Text(
                    castData?.knownForDepartment ?? '',
                    style: context.textTheme.bodyText1?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors().grey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
