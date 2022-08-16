import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/constant/apiConstants.dart';
import 'package:movie_app/model/token_model.dart';
import 'package:movie_app/service/authenticationApi.dart';
import 'package:movie_app/view/home/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 4), (_) {
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
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/11.PNG'),
          context.emptySizedHeightBoxHigh,
          // loadingIndicator()
          SizedBox(
            height: context.dynamicHeight(0.1),
            width: context.dynamicWidth(0.5),
            child: Image.asset('assets/gifs/loading.gif'),
          )
        ],
      ),
    ));
  }

  // Widget loadingIndicator() {
  //   return FutureBuilder<TokenModel?>(
  //     future: token,
  //     builder: (ctx, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         if (snapshot.hasError) {
  //           return Center(
  //             child: Text(
  //               '${snapshot.error} occurred',
  //               style: TextStyle(fontSize: 18),
  //             ),
  //           );
  //         } else if (snapshot.hasData) {
  //           ApiConstants.requestKey = snapshot.data!.requestToken;
  //           WidgetsBinding.instance.addPostFrameCallback((_) {
  //             Navigator.pushReplacementNamed(context, "/onboard");
  //           });
  //         }
  //       }
  //       return Center(
  //         child: SizedBox(
  //           height: context.dynamicHeight(0.1),
  //           width: context.dynamicWidth(0.5),
  //           child: Image.asset('assets/gifs/loading.gif'),
  //         ),
  //       );
  //     },
  //   );
  // }
}
