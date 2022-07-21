import 'package:flutter/material.dart';

//Light theme colors
const lightBgColor = Color(0xffFFFFFF);
const lightTextColor = Color(0xff000000);

//Colors that apply to both themes
const pimaryColor = Color(0xffffffff);
const greenColor1 = Color(0xff4de48a);
const greenColor2 = Color(0xff1dc479);
const redColor1 = Color(0xffFF4B4B);
const redColor2 = Color(0xffFF4545);
const favouriteColor = Color(0xffFF1D1D);
const yellowColor = Color(0xffFEAD1D);
const orangeColor1 = Color(0xffE86D28);
const orangeColor2 = Color(0xffDA6317);

//Dark theme colors
const darkBgColor = Color(0xff000000);
const darkTextColor = Color(0xffffffff);

final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0));

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkBgColor,
);
