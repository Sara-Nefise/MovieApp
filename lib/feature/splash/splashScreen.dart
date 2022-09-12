import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/constant/appImages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppImage appImages = AppImage();

  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 4), (_) {
      Navigator.pushReplacementNamed(context, "/onboard");
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(appImages.mIconImage),
          context.emptySizedHeightBoxHigh,
          SizedBox(
            height: context.dynamicHeight(0.1),
            width: context.dynamicWidth(0.5),
            child: Image.asset(appImages.loadingGif),
          )
        ],
      ),
    ));
  }
}
