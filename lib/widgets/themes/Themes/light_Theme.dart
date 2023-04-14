import 'package:flutter/material.dart';

import '../colors/HexColors.dart';

ThemeData lightTheme =ThemeData(
  primaryColor: Colors.black,
  appBarTheme: AppBarTheme(
      color:appBarClr,

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
    ),
    subtitle2: TextStyle(
      fontSize: 20,
      fontFamily: 'lightFont',
      fontWeight: FontWeight.bold,
      color: Colors.black
    ),
    bodyText2: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
  ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: Colors.black,
      prefixIconColor: Colors.black,
      suffixIconColor: Colors.black,
      hintStyle: TextStyle(
        color: Colors.black
      ),
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder:OutlineInputBorder(
        borderSide: BorderSide(color: appBarClr,width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      errorBorder:OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red,width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
);