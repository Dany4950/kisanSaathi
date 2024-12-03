import 'package:flutter/material.dart';

class Apptheme {
  static Color? appBackgroundColor = Colors.grey[100];
  static const buttonColorYellow = Color.fromRGBO(255, 153, 0, 0.926);

  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: appBackgroundColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            //app logo green color
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color.fromARGB(255, 19, 126, 23)),
        
        //subtext in landing page theme
        bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
