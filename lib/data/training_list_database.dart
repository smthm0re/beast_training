import 'package:beast_training/models/training.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  }

  void loadData() {
    trainingList = _trainingBox.get("trainingListBox");
  }

  void updateDataBase() {
    _trainingBox.put("trainingListBox", trainingList);
  }
}
