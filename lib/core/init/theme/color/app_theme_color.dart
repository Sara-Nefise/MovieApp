import 'package:flutter/material.dart';

import 'color_theme.dart';

class LightColors implements IColors {
  @override
  Color? appBarColor;

  @override
  Brightness? brightness;

  @override
  ColorScheme? colorScheme;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabbarNormalColor;

  @override
  Color? tabbarSelectedColor;
  @override
  Color? inputTextButtonColor;
  @override
  Color? buttonSelectedColor;

  @override
  final AppColors colors = AppColors();

  LightColors() {
    appBarColor = colors.black;
    scaffoldBackgroundColor = colors.black;
    tabBarColor = colors.black;
    tabbarNormalColor = colors.white;
    tabbarSelectedColor = colors.red;

    // buttonNormalColor = colors.green;
    // buttonGoogleColor = colors.brightRed;
    // inputTextButtonColor = colors.lightGrey;
    // buttonSelectedColor = colors.green;
    colorScheme = const ColorScheme.light().copyWith(
        onPrimary: colors.white, //xx Her ikisinde ortaktır
        onSecondary: colors.red,
        onSurface: colors.white,
        primary: colors.red);
  }

  @override
  Color? buttonGoogleColor;

  @override
  Color? buttonNormalColor;
}
