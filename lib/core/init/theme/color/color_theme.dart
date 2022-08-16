import 'package:flutter/material.dart';

class AppColors {
  final Color red = Color(0xFFE21221);
  final Color white = Color(0xFFFFFFFF);
  final Color black = Color(0xFF181A20);
  final Color grey = Color.fromRGBO(201, 202, 204, 1);
  final Color lightBlack = Color.fromARGB(255, 34, 37, 46);
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
