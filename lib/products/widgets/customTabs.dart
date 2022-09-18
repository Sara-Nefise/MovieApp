import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/constant/appStrings.dart';

import 'package:movie_app/feature/movieDetailPage/model/movieVideos_model.dart';
import 'package:movie_app/feature/movieDetailPage/model/similarMovies.dart';
import 'package:movie_app/products/widgets/moviesVideosList.dart';
import 'package:movie_app/products/widgets/similarMovieList.dart';

class CustomTab extends StatefulWidget {
  final MovieVideos? movieVideos;
  final SimilarMovies? similarMovies;
  const CustomTab({
    Key? key,
    required this.movieVideos,
    required this.similarMovies,
  }) : super(key: key);

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> with TickerProviderStateMixin {
  TabController? _tabController;
  AppStrings appstrings = AppStrings();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelStyle: context.textTheme.headline6,
          indicatorWeight: 1,
          tabs: [
            Tab(
              text: appstrings.videoText,
            ),
            Tab(
              text: appstrings.similarMoviesText,
            ),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        SizedBox(
          height: context.dynamicHeight(0.5),
          child: TabBarView(
            controller: _tabController,
            children: [
              MoviesVideoList(
                movieVideos: widget.movieVideos,
              ),
              SimilarMovieList(similarMovies: widget.similarMovies)
            ],
          ),
        )
      ],
    );
  }
}
