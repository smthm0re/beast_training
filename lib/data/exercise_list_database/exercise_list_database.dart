import 'package:hive_flutter/hive_flutter.dart';

class ExerciseListDataBase {
  List exerciseList = [];

  final _exerciseBox = Hive.box('exerciseBox');

  void createInitialData() {
    exerciseList = [];
  }

  void loadData() {
    exerciseList = _exerciseBox.get("exerciseListBox");
  }

  void updateDataBase() {
    _exerciseBox.put("exerciseListBox", exerciseList) ?? [];
  }
}
