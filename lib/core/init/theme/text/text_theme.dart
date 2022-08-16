import 'package:flutter/material.dart';

abstract class ITextTheme {
  final Color? primaryColor;
  late final TextTheme data;
  TextStyle? headline2;
  TextStyle? headline4;
  TextStyle? headline5;

  TextStyle? bodyText1;
  TextStyle? bodyText2;
  String? fontFamily;

  ITextTheme(this.primaryColor);
}
