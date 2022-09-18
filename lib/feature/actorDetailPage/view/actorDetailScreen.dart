import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/constant/appImages.dart';

import 'package:movie_app/core/constant/appStrings.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:movie_app/feature/actorDetailPage/model/actorData_model.dart';
import 'package:movie_app/feature/actorDetailPage/model/actorPersonalInfo_model.dart';
import 'package:movie_app/feature/actorDetailPage/view/actorMovies.dart';
import 'package:movie_app/feature/movieDetailPage/view/detailScreen.dart';
import 'package:movie_app/products/widgets/coverImage.dart';
import 'package:movie_app/products/widgets/featureContainer.dart';

import '../../../core/cubit/ActorInfo/actor_info_cubit.dart';

class ActorDetailScreen extends StatelessWidget {
  Cast? castData;
  ActorDetailScreen({
    Key? key,
    required this.castData,
  }) : super(key: key);

  AppStrings appStrings = AppStrings();
  AppImage appImages = AppImage();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ActorInfoCubit>(context)
        .getMovieInfo((castData?.id).toString());
    String url = "https://image.tmdb.org/t/p/w500${castData?.profilePath}";
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: BlocBuilder<ActorInfoCubit, ActorInfoState>(
              builder: (context, state) {
            if (state is ActorInfoFailure) {
              return lostConnetion(
                  appImages: appImages, appStrings: appStrings);
            } else if (state is ActorInfoLoaded) {
              ActorPersonalInfo? actorData = state.data[0];
              return SingleChildScrollView(
                  child: Column(children: [
                CoverImage(
                  result: castData,
                  url: url,
                ),
                Padding(
                    padding: context.paddingNormal.copyWith(bottom: 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.dynamicHeight(0.25),
                            child: Text(
                              '${actorData?.name}',
                              style: context.textTheme.headline5,
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      const Icon(Icons.star),
                                      context.emptySizedWidthBoxLow,
                                      Text(
                                        '${actorData?.popularity}',
                                        style: context.textTheme.bodyText1
                                            ?.copyWith(color: AppColors().red),
                                      ),
                                      context.emptySizedWidthBoxLow,
                                      Icon(Icons.arrow_forward_ios,
                                          color: AppColors().red),
                                      context.emptySizedWidthBoxLow,
                                      Text('${actorData?.birthday}',
                                          style: context.textTheme.bodyText1),
                                    ],
                                  ),
                                ),
                                FeatureContainer(
                                    text: actorData?.knownForDepartment),
                              ]),
                          context.emptySizedHeightBoxLow,
                          Text(
                            appStrings.biographyText,
                            style: context.textTheme.headline5
                                ?.copyWith(color: AppColors().red),
                          ),
                          context.emptySizedHeightBoxLow,
                          Text(
                            '${actorData?.biography}',
                            style: context.textTheme.bodyText1,
                            maxLines: 7,
                          ),
                          context.emptySizedHeightBoxLow,
                          Text(
                            appStrings.movieText,
                            style: context.textTheme.headline5
                                ?.copyWith(color: AppColors().red),
                          ),
                          ActorMoviesScreen(
                            actorMovies: state.data[1],
                          ),
                        ])),
              ]));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ));
  }
}
