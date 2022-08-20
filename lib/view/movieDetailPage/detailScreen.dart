import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/cubit/MovieInfo_cubit/movie_informations_cubit.dart';
import 'package:movie_app/model/actorData_model.dart';
import 'package:movie_app/view/movieDetailPage/actorCard.dart';
import 'package:movie_app/widgets/coverImage.dart';
import 'package:movie_app/widgets/customTabs.dart';
import 'package:movie_app/widgets/featureContainer.dart';
import '../../core/constant/apiConstants.dart';

class DetailScreen extends StatelessWidget {
  dynamic result;
  DetailScreen({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MovieInformationsCubit>(context)
        .getMovieInfo((result?.id).toString());
    String imageUrl = '${ApiConstants.photoBaseUrl}/${result?.posterPath}';
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: BlocBuilder<MovieInformationsCubit, MovieInformationsState>(
          builder: (context, state) {
        if (state is MovieInformationsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MovieInformationsFailure) {
          return const Text('state error');
        } else if (state is MovieInformationsLoaded) {
          return SafeArea(
            child: SingleChildScrollView(
                child: Column(
              children: [
                CoverImage(
                  result: result,
                  url: imageUrl,
                ),
                _movieDetail(context),
                _movieActors(context, state.data[0]),
                CustomTab(
                  movieVideos: state.data[1],
                  similarMovies: state.data[2],
                )
              ],
            )),
          );
        } else {
          return const Center(
            child: Text('initial'),
          );
        }
      }),
    );
  }

  Padding _movieDetail(BuildContext context) {
    return Padding(
      padding: context.paddingNormal.copyWith(bottom: 0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.dynamicHeight(0.25),
              child: Text(
                '${result?.originalTitle}',
                style: context.textTheme.headline5?.copyWith(fontSize: 23),
              ),
            ),
            context.emptySizedHeightBoxLow,
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                child: Row(
                  children: [
                    Icon(Icons.star, color: AppColors().red),
                    context.emptySizedWidthBoxLow,
                    Text(
                      '${result?.voteAverage}',
                      style: context.textTheme.bodyText1
                          ?.copyWith(color: AppColors().red),
                    ),
                    context.emptySizedWidthBoxLow,
                    Icon(Icons.arrow_forward_ios, color: AppColors().red),
                    context.emptySizedWidthBoxLow,
                    Text('${result?.releaseDate}',
                        style: context.textTheme.bodyText1),
                  ],
                ),
              ),
              featureContainer(
                text: result?.originalLanguage,
              ),
            ]),
            context.emptySizedHeightBoxLow,
            Text(
              '${result?.overview}',
              style: context.textTheme.bodyText2?.copyWith(fontSize: 19),
              maxLines: 5,
              // overflow: tag? TextOverflow.ellipsis:TextOverflow.visible,
            ),
            // TextButton(
            //  onPressed: () { tag=!tag; },
            //  child:Text(''),
            // ),
          ],
        ),
      ),
    );
  }

  _movieActors(BuildContext context, ActorData data) {
    return Container(
        padding: context.paddingNormal.copyWith(bottom: 0),
        height: MediaQuery.of(context).size.height * 0.15,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.cast?.length,
            itemBuilder: (context, index) {
              return ActorCard(
                castData: data.cast?[index],
              );
            }));
  }
}
