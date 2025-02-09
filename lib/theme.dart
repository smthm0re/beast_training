import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.red,

  listTileTheme: const ListTileThemeData(
    iconColor: Color.fromARGB(255, 0, 0, 0),
    tileColor: Color.fromARGB(255, 255, 255, 255),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 29, 170, 96),
    foregroundColor: Colors.white,
  ),

  scaffoldBackgroundColor: const Color.fromARGB(255, 241, 241, 241),

  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    backgroundColor: Color.fromARGB(255, 241, 241, 241),
    titleTextStyle: TextStyle(
      color: Color.fromARGB(255, 29, 170, 96),
      fontWeight: FontWeight.w600,
      fontSize: 22,
    ),
  ),

  fontFamily: 'Poppins',
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: const TextStyle(
      color: Color.fromARGB(255, 51, 51, 51),
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
    ),
  ),
);
