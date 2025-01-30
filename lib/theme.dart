import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.red,
  listTileTheme: const ListTileThemeData(
    iconColor: Color.fromARGB(255, 0, 0, 0),
    tileColor: Color.fromARGB(255, 241, 241, 241),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 55, 173, 87),
    foregroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 220, 223, 225),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    backgroundColor: Color.fromARGB(255, 241, 241, 241),
    titleTextStyle: TextStyle(
      color: Color.fromARGB(255, 55, 173, 87),
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
  ),
);
