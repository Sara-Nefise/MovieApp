import 'package:flutter/material.dart';

class AppColors {
  final Color red = const Color(0xFFE21221);
  final Color white = const Color(0xFFFFFFFF);
  final Color black = const Color(0xFF181A20);
  final Color grey = const Color.fromRGBO(201, 202, 204, 1);
  final Color lightBlack = const Color.fromARGB(255, 34, 37, 46);
}

abstract class IColors {
  AppColors get colors;
  Color? scaffoldBackgroundColor;
  Color? appBarColor;
  Color? tabBarColor;
  Color? tabbarSelectedColor;
  Color? tabbarNormalColor;
  Brightness? brightness;
  Color? buttonNormalColor;
  Color? buttonSelectedColor;
  Color? buttonGoogleColor;
  Color? inputTextButtonColor;
  ColorScheme? colorScheme;
}
