import 'package:beast_training/data/training_list_database.dart';
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
            deleteTraining: (context) {
              setState(() {
                dataBaseTrainingList.deleteTraining(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            dataBaseTrainingList.addTraining();
          });
        },
        tooltip: 'Добавить тренировку',
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
