import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:movie_app/cubit/cubit/actor_info_cubit.dart';
import 'package:movie_app/model/actorPersonalInfo_model.dart';
import 'package:movie_app/model/actorData_model.dart';

import 'package:movie_app/view/actorDetailPage/actorMovies.dart';
import 'package:movie_app/widgets/featureContainer.dart';

import 'package:movie_app/widgets/coverImage.dart';

class ActorDetailScreen extends StatefulWidget {
  Cast? castData;
  ActorDetailScreen({
    Key? key,
    required this.castData,
  }) : super(key: key);

  @override
  State<ActorDetailScreen> createState() => _ActorDetailScreenState();
}

class _ActorDetailScreenState extends State<ActorDetailScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ActorInfoCubit>(context)
        .getMovieInfo((widget.castData?.id).toString());
    String url =
        "https://image.tmdb.org/t/p/w500${widget.castData?.profilePath}";
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
        body: SafeArea(
          child: BlocBuilder<ActorInfoCubit, ActorInfoState>(
              builder: (context, state) {
            if (state is ActorInfoLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ActorInfoFailure) {
              return const Text('state error');
            } else if (state is ActorInfoLoaded) {
              ActorPersonalInfo? actorData = state.data[0];
              return SingleChildScrollView(
                  child: Column(children: [
                CoverImage(
                  result: widget.castData,
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
                              style: context.textTheme.headline5
                                  ?.copyWith(fontSize: 23),
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Icon(Icons.star, color: AppColors().red),
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
                                featureContainer(
                                    text: actorData?.knownForDepartment),
                              ]),
                          context.emptySizedHeightBoxLow,
                          Text(
                            'Actor biography',
                            style: context.textTheme.headline5?.copyWith(
                                color: AppColors().red, fontSize: 20),
                          ),
                          context.emptySizedHeightBoxLow,
                          Text(
                            '${actorData?.biography}',
                            style: context.textTheme.bodyText1,
                            maxLines: 7,
                          ),
                          context.emptySizedHeightBoxLow,
                          Text(
                            'Movies',
                            style: context.textTheme.headline5?.copyWith(
                                color: AppColors().red, fontSize: 20),
                          ),
                          ActorMoviesScreen(
                            actorMovies: state.data[1],
                          ),
                        ])),
              ]));
            } else {
              return const Center(
                child: Text('initial'),
              );
            }
          }),
        ));
  }
}
