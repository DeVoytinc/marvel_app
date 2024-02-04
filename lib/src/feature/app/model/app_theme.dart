import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) => ThemeData(

  scaffoldBackgroundColor: const Color.fromARGB(255, 39, 39, 39),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      
    ),
  );
