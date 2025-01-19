import 'package:hive/hive.dart';

class ToDoDataBase {
  List trainingList = [];

  final _trainingBox = Hive.box("trainingBox");

  void createInitialData() {
    trainingList = ['Тренировка №1', 'Тренировка №2'];
  }

  void loadData() {
    trainingList = _trainingBox.get("TRAININGLIST");
  }

  void updateDataBase() {
    _trainingBox.put("TRAININGLIST", trainingList);
  }
}
