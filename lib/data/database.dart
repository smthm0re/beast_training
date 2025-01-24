import 'package:hive/hive.dart';

class TrainingDataBase {
  List trainingList = [];

  final _trainingBox = Hive.box("trainingBox");

  void createInitialData() {
    trainingList = ['Тренировка №1'];
  }

  void loadData() {
    trainingList = _trainingBox.get("TRAININGLIST");
  }

  void updateDataBase() {
    _trainingBox.put("TRAININGLIST", trainingList);
  }
}
