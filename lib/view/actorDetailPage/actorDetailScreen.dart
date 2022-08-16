import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:movie_app/cubit/actorPersonalInfo/actor_personal_info_cubit.dart';
import 'package:movie_app/view/actorDetailPage/actorMovies.dart';
import 'package:movie_app/widgets/customTabs.dart';
import 'package:movie_app/widgets/featureContainer.dart';

import 'package:movie_app/model/actorData_model.dart';
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
    BlocProvider.of<ActorPersonalInfoCubit>(context)
        .getActorsInfo((widget.castData?.id).toString());
    String url =
        "https://image.tmdb.org/t/p/w500${widget.castData?.profilePath}";
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<ActorPersonalInfoCubit, ActorPersonalInfoState>(
              builder: (context, state) {
            if (state is ActorPersonalInfoLoading) {
              return const CircularProgressIndicator();
            } else if (state is ActorPersonalInfoFailure) {
              return const Text('state error');
            } else if (state is ActorPersonalInfoLoaded) {
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
                              '${state.actorInfo?.name}',
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
                                        '${state.actorInfo?.popularity}',
                                        style: context.textTheme.bodyText1
                                            ?.copyWith(color: AppColors().red),
                                      ),
                                      context.emptySizedWidthBoxLow,
                                      Icon(Icons.arrow_forward_ios,
                                          color: AppColors().red),
                                      context.emptySizedWidthBoxLow,
                                      Text('${state.actorInfo?.birthday}',
                                          style: context.textTheme.bodyText1),
                                    ],
                                  ),
                                ),
                                featureContainer(
                                    text: state.actorInfo?.knownForDepartment),
                              ]),
                          context.emptySizedHeightBoxLow,
                          Text(
                            'Actor biography',
                            style: context.textTheme.headline5?.copyWith(
                                color: AppColors().red, fontSize: 20),
                          ),
                          context.emptySizedHeightBoxLow,
                          Text(
                            '${state.actorInfo?.biography}',
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
                            actorId: '${state.actorInfo?.id}',
                          ),
                          CustomTab()
                        ])),
              ]));
            } else {
              return Center(
                child: Text('initial'),
              );
            }
          }),
        ));
  }
}
