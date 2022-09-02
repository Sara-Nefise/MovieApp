import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/init/theme/text/text_theme.dart';
import '../color/color_theme.dart';

class TextThemeLight implements ITextTheme {
  @override
  TextStyle? bodyText1;

  @override
  TextStyle? bodyText2;

  @override
  late final TextTheme data;
  @override
  TextStyle? headline2;

  @override
  String? fontFamily;

  @override
  TextStyle? headline4;

  @override
  TextStyle? headline5;

  @override
  Color? primaryColor;

  TextThemeLight(this.primaryColor) {
    data = const TextTheme(
      headline2: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
      headline4: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      headline5: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      bodyText2: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    ).apply(
        bodyColor: AppColors().white,
        fontFamily: fontFamily,
        displayColor: AppColors().white);
    fontFamily = GoogleFonts.urbanist().fontFamily;
  }
}
