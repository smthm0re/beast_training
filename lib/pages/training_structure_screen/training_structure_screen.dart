import 'package:flutter/material.dart';

class TrainingStructureScreen extends StatefulWidget {
  const TrainingStructureScreen({super.key});

  @override
  State<TrainingStructureScreen> createState() => _TrainingStructureScreenState();
}

class _TrainingStructureScreenState extends State<TrainingStructureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Тренировка №1'),
      ),
    );
  }
}
