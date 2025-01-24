import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.red,
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
    tileColor: Color.fromARGB(255, 51, 51, 51),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 95, 156, 98),
    foregroundColor: Color.fromARGB(255, 28, 28, 28),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Color.fromARGB(255, 95, 156, 98),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: const TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  ),
);
