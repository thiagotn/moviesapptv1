import 'package:flutter/material.dart';

defaultTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: const Color(0xff202020),
    splashColor: const Color(0xff202020),
    backgroundColor: const Color(0xff202020),
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: Colors.grey,
      brightness: Brightness.dark,
    ).copyWith(
      secondary: Colors.orange,
      primary: Colors.grey,
      brightness: Brightness.dark,
    ),
    // Set default font sizes
    textTheme: const TextTheme(
      overline: TextStyle(color: Colors.grey),
      headline1: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 26.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16.0,
        color: Colors.white70,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16.0,
        color: Colors.white,
        height: 1.4,
      ),
      caption: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14.0,
        color: Colors.white54,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
