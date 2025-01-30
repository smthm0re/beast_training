import 'package:beast_training/data/training_list_database.dart';
import 'package:beast_training/models/training.dart';
import 'package:beast_training/ui-kit/widgets/training_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class TrainingListScreen extends StatefulWidget {
  const TrainingListScreen({super.key});

  @override
  State<TrainingListScreen> createState() => _TrainingListScreenState();
}

class _TrainingListScreenState extends State<TrainingListScreen> {
  final _trainingBox = Hive.box("defaultBox");
  TrainingListDataBase dataBaseTrainingList = TrainingListDataBase();

  @override
  void initState() {
    if (_trainingBox.get("trainingListBox") == null) {
      dataBaseTrainingList.createInitialData();
    } else {
      dataBaseTrainingList.loadData();
    }

    super.initState();
  }

  void addTraining() {
    final Training newTraining = Training(
      id: dataBaseTrainingList.trainingList.length + 1,
      date: DateTime.now(),
    );
    setState(() {
      dataBaseTrainingList.trainingList.add(newTraining);
      dataBaseTrainingList.trainingList.sort((a, b) => b.id.compareTo(a.id));
      dataBaseTrainingList.updateDataBase();
    });
  }

  void deleteTraining(int index) {
    final int deletedIdTraining = dataBaseTrainingList.trainingList[index].id;
    setState(() {
      dataBaseTrainingList.trainingList.removeAt(index);
      for (int i = 0; i < dataBaseTrainingList.trainingList.length; i++) {
        if (dataBaseTrainingList.trainingList[i].id > deletedIdTraining) {
          dataBaseTrainingList.trainingList[i] = Training(
            id: dataBaseTrainingList.trainingList[i].id - 1,
            date: dataBaseTrainingList.trainingList[i].date,
          );
        }
      }
    });
    dataBaseTrainingList.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BeastTrainingApp'),
      ),
      body: ListView.builder(
        itemCount: dataBaseTrainingList.trainingList.length,
        itemBuilder: (context, index) {
          final training = dataBaseTrainingList.trainingList[index];
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
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
