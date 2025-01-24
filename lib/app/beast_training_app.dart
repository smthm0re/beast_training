import 'package:beast_training/pages/training_list_screen/training_list_screen.dart';
import 'package:beast_training/pages/training_structure_screen/training_structure_screen.dart';
import 'package:beast_training/theme/theme.dart';
import 'package:flutter/material.dart';

class BeastTrainingApp extends StatelessWidget {
  const BeastTrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: {
        '/training_list_screen/': (context) => const TrainingListScreen(),
        '/training_structure_screen/': (context) =>
            const TrainingStructureScreen(),
      },
      initialRoute: '/training_list_screen/',
    );
  }
}
