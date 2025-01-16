import 'package:beast_training/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runApp(const BeastTraining());
  await Hive.initFlutter();
}

class BeastTraining extends StatelessWidget {
  const BeastTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 95, 156, 98),
          foregroundColor: Color.fromARGB(255, 28, 28, 28),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 28, 28, 28),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 95, 156, 98),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 28, 28, 28),
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          bodySmall: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
