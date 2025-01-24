import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.red,
  listTileTheme: const ListTileThemeData(
    iconColor: Color.fromARGB(255, 255, 255, 255),
    tileColor: Color.fromARGB(255, 34, 45, 67),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 95, 156, 98),
    foregroundColor: Color.fromARGB(255, 34, 45, 67),
  ),
  scaffoldBackgroundColor: Color.fromARGB(255, 18, 22, 30),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: const Color.fromARGB(255, 26, 32, 44),
    titleTextStyle: TextStyle(
      color: const Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.bold,
      fontSize: 22,
      shadows: [
        Shadow(
          offset: Offset(2.0, 2.0),
          blurRadius: 4.0,
          color: Colors.black26,
        ),
      ],
    ),
  ),
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 18,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          offset: Offset(2.0, 2.0),
          blurRadius: 4.0,
          color: Colors.black26,
        ),
      ],
    ),
    bodySmall: const TextStyle(
      color: Color.fromARGB(255, 199, 207, 214),
      fontSize: 14,
      shadows: [
        Shadow(
          offset: Offset(2.0, 2.0),
          blurRadius: 4.0,
          color: Colors.black26,
        ),
      ],
    ),
  ),
);
