import 'package:flutter/material.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/widgets/customElevatedButton.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboard.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Welcome to Mova',
              style: context.textTheme.headline2,
            ),
            context.emptySizedHeightBoxNormal,
            Text(
              'The best movie streaming app of the century\n to make your days great!',
              style: context.textTheme.bodyText1
                  ?.copyWith(color: AppColors().white.withOpacity(0.7)),
              textAlign: TextAlign.center,
            ),
            context.emptySizedHeightBoxNormal,
            CustomElevatedButton(
              onPressedFunc: () {
                context.navigateToReset('/login');
              },
              buttonText: 'Get Started',
            ),
            context.emptySizedHeightBoxNormal,
          ],
        ),
      ),
    );
  }
}
