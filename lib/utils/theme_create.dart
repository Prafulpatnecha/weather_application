import 'package:flutter/material.dart';

class ThemeCreate
{
  static ThemeData themeDataLight=ThemeData(
    primaryColor: Colors.blue,
    disabledColor: Colors.white,
    focusColor: Colors.black,
    canvasColor: Colors.white
  );
  static ThemeData themeDataDark=ThemeData.dark().copyWith(
    canvasColor: Colors.black,
    primaryColor: Colors.blue,
    disabledColor: Colors.white,
    focusColor: Colors.white,
  );
}