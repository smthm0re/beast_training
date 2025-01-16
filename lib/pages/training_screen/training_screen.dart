import 'package:beast_training/pages/training_screen/training_tile/training_tile.dart';
import 'package:flutter/material.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  void _addTraining() {
    setState(() {
// todo: добавить что делать при нажатии кнопки
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BEAST TRAINING'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          const trainingNumber = 'Тренировка №1';
          return const TrainingTile(
            trainingNumber: trainingNumber,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTraining,
        tooltip: 'Добавить тренировку',
        child: const Icon(Icons.add),
      ),
    );
  }
}
