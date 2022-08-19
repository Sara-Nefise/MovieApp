import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:movie_app/model/movieVideos_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieVideo extends StatefulWidget {
  Results? results;
  MovieVideo({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  State<MovieVideo> createState() => _MovieVideoState();
}

class _MovieVideoState extends State<MovieVideo> {
  late bool _isPlayerReady;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  late YoutubePlayerController controller;
  void listener() {
    if (_isPlayerReady && mounted && !controller.value.isFullScreen) {
      setState(() {
        _playerState = controller.value.playerState;
        _videoMetaData = controller.metadata;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.paused;
    _isPlayerReady = false;
    controller = YoutubePlayerController(
      initialVideoId: widget.results?.key ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    )..addListener(listener);
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      height: context.dynamicHeight(0.2),
      child: Row(children: [
        SizedBox(
            height: context.dynamicHeight(0.19),
            width: context.dynamicWidth(0.6),
            child: YoutubePlayer(
                onReady: () {
                  controller.addListener(listener);
                },
                controller: controller,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.grey,
                ))),
        context.emptySizedWidthBoxNormal,
        Expanded(child: Text(widget.results?.name ?? ''))
      ]),
    );
  }
}
