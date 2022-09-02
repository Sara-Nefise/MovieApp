import 'package:flutter/material.dart';
import 'package:movie_app/core/init/theme/color/app_theme_color.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:movie_app/core/init/theme/text/light_text_theme.dart';
import 'package:movie_app/core/init/theme/text/text_theme.dart';

abstract class ITheme {
  ITextTheme get textTheme;
  IColors get colors;
}

ThemeData createThemeData() => ThemeData();

ThemeData createTheme(ITheme theme) => ThemeData(
      scaffoldBackgroundColor: AppColors().black,
      textSelectionTheme: const TextSelectionThemeData(),
      fontFamily: theme.textTheme.fontFamily,
      textTheme: theme.textTheme.data,
      cardColor: theme.colors.colorScheme?.onSecondary,
      bottomAppBarColor: theme.colors.scaffoldBackgroundColor,
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors().red)),
        labelColor: theme.colors.tabbarSelectedColor,
        unselectedLabelColor: theme.colors.tabbarNormalColor,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: theme.colors.appBarColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white, size: 25)),
      colorScheme: theme.colors.colorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            primary: theme.colors.colorScheme?.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textStyle: const TextStyle(
                wordSpacing: 2,
                letterSpacing: 1,
                fontSize: 18,
                fontWeight: FontWeight.w500),
            backgroundColor: theme.colors.buttonNormalColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: AppColors().grey,
        prefixIconColor: AppColors().grey,
        hintStyle: TextStyle(
          color: AppColors().grey.withOpacity(0.6),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        fillColor: AppColors().lightBlack,
        filled: true,
      ),
      iconTheme: IconThemeData(color: AppColors().red)
    );

// class AppThemeDark extends ITheme {
//   @override
//   late final ITextTheme textTheme;
//   AppThemeDark() {
//     textTheme = TextThemeDark(colors.colors.mediumGrey);
//   }

//   @override
//   IColors get colors => DarkColors();
// }
class AppThemeLight extends ITheme {
  @override
  late final ITextTheme textTheme;
  AppThemeLight() {
    textTheme = TextThemeLight(colors.colors.black);
  }

  @override
  IColors get colors => LightColors();
}
