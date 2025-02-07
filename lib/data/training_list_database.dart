import 'package:beast_training/models/training.dart';
import 'package:hive_flutter/hive_flutter.dart';

TrainingListDataBase trainingDataBase = TrainingListDataBase();

class TrainingListDataBase {
  List trainingList = [];

  final _trainingBox = Hive.box("defaultBox");

  void createInitialData() {
    trainingList = [
      Training(
        id: 1,
        date: DateTime.now(),
      ),
    ];
    updateDataBase();
  }

  void loadData() {
    trainingList = _trainingBox.get("trainingListBox");
  }

  void updateDataBase() {
    _trainingBox.put("trainingListBox", trainingList);
  }

  void addTraining() {
    final Training newTraining = Training(
      id: trainingList.length + 1,
      date: DateTime.now(),
    );
    trainingList.add(newTraining);
    trainingList.sort((a, b) => b.id.compareTo(a.id));
    updateDataBase();
  }

  void deleteTraining(int index) {
    final int deletedIdTraining = trainingList[index].id;
    trainingList.removeAt(index);
    for (int i = 0; i < trainingList.length; i++) {
      if (trainingList[i].id > deletedIdTraining) {
        trainingList[i] = Training(
          id: trainingList[i].id - 1,
          date: trainingList[i].date,
        );
      }
    }
    updateDataBase();
  }
}
