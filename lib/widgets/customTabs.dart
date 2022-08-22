import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:movie_app/model/movieVideos_model.dart';
import 'package:movie_app/model/similarMovies.dart';
import 'package:movie_app/view/movieDetailPage/moviesVideosList.dart';
import 'package:movie_app/view/movieDetailPage/similarMovieList.dart';

class CustomTab extends StatefulWidget {
  MovieVideos? movieVideos;
  SimilarMovies? similarMovies;
  CustomTab({
    Key? key,
    required this.movieVideos,
    required this.similarMovies,
  }) : super(key: key);

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> with TickerProviderStateMixin {
  TabController? _tabController;

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
          tabs: const [
            Tab(
              text: 'Videos',
            ),
            Tab(
              text: 'Similar Movies',
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
