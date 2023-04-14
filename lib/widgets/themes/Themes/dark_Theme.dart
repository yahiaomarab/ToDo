import 'package:flutter/material.dart';

import '../colors/HexColors.dart';

ThemeData darkTheme =ThemeData(
  scaffoldBackgroundColor:darkGreyClr ,
  primaryColor: Colors.white,
  appBarTheme: AppBarTheme(
    color:darkHeaderClr,
  ),
  textTheme: TextTheme(
    caption: TextStyle(
      fontFamily: 'lightFont',
      fontSize: 20,
    ),
    subtitle1: TextStyle(
      fontSize: 20,
      fontFamily: 'lightFont',

    ),
    bodyText1: TextStyle(
      fontSize: 40,
      fontFamily: 'lightFont',
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
    bodyText2: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ),
    subtitle2: TextStyle(
        fontSize: 20,
        fontFamily: 'lightFont',
        fontWeight: FontWeight.bold,
        color: Colors.white
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.white,
    suffixIconColor: Colors.white,
    labelStyle: TextStyle(
      color: Colors.grey,
    ),
    hintStyle: TextStyle(
        color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder:OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white,width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    errorBorder:OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red,width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);