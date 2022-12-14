import 'package:flutter/material.dart';
import 'package:movie_app/core/constant/appImages.dart';
import 'package:movie_app/core/constant/appStrings.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/products/widgets/customElevatedButton.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({Key? key}) : super(key: key);
  AppStrings appStrings = AppStrings();
  AppImage appImages = AppImage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(appImages.onboardImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                appStrings.welcomeText,
                style: context.textTheme.headline2,
              ),
              context.emptySizedHeightBoxNormal,
              Text(
                appStrings.introText,
                style: context.textTheme.bodyText1
                    ?.copyWith(color: AppColors().white.withOpacity(0.7)),
                textAlign: TextAlign.center,
              ),
              context.emptySizedHeightBoxNormal,
              CustomElevatedButton(
                onPressedFunc: () {
                  Navigator.pushReplacementNamed(context, "/home");
                },
                buttonText: appStrings.getStartText,
              ),
              context.emptySizedHeightBoxNormal,
            ],
          ),
        ),
      ),
    );
  }
}
