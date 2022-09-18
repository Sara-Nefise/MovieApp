import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:movie_app/feature/actorDetailPage/view/actorDetailScreen.dart';
import 'package:movie_app/feature/actorDetailPage/model/actorData_model.dart';

class ActorCard extends StatelessWidget {
  final Cast? castData;

 const ActorCard({
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
              CachedNetworkImage(
                imageUrl: Url,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 35,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: context.highBorderRadius,
                      image: const DecorationImage(
                        image: AssetImage('assets/gifs/skeleton.gif'),
                        fit: BoxFit.fill,
                      )),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
