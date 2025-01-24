import 'package:beast_training/pages/training_list_screen/training_tile_widget/training_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Training {
  final int id;
  final DateTime date;

  Training({
    required this.id,
    required this.date,
  });
}

class TrainingListScreen extends StatefulWidget {
  const TrainingListScreen({super.key});

  @override
  State<TrainingListScreen> createState() => _TrainingListScreenState();
}

class _TrainingListScreenState extends State<TrainingListScreen> {
  final List<Training> _trainingList = [];

  void addTraining() {
    final Training newTraining = Training(
      id: _trainingList.length + 1,
      date: DateTime.now(),
    );
    setState(() {
      _trainingList.add(newTraining);
      _trainingList.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  void deleteTraining(int index) {
    final int deletedIdTraining = _trainingList[index].id;
    setState(() {
      _trainingList.removeAt(index);
      for (int i = 0; i < _trainingList.length; i++) {
        if (_trainingList[i].id > deletedIdTraining) {
          _trainingList[i] = Training(
            id: _trainingList[i].id - 1,
            date: _trainingList[i].date,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список тренировок'),
      ),
      body: ListView.builder(
        itemCount: _trainingList.length,
        itemBuilder: (context, index) {
          final training = _trainingList[index];
          return TrainingTileWidget(
            idTraining: "Тренировка № ${training.id}",
            dateTraining: DateFormat('dd.MM.yyyy').format(training.date),
            deleteTraining: (context) => deleteTraining(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTraining,
        tooltip: 'Добавить тренировку',
        child: const Icon(Icons.add),
      ),
    );
  }
}
