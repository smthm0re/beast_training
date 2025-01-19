import 'package:beast_training/router/router.dart';
import 'package:beast_training/theme/theme.dart';
import 'package:flutter/material.dart';

class BeastTrainingApp extends StatelessWidget {
  const BeastTrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: routes,
    );
  }
}
