import 'package:flutter/material.dart';

class TrainingStructure extends StatefulWidget {
  const TrainingStructure({super.key});

  @override
  State<TrainingStructure> createState() => _TrainingStructureState();
}

class _TrainingStructureState extends State<TrainingStructure> {
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
