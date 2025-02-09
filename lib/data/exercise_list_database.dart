import 'package:beast_training/models/exercise.dart';
import 'package:hive_flutter/hive_flutter.dart';

ExerciseListDataBase exerciseListDataBase = ExerciseListDataBase();

class ExerciseListDataBase {
  List<Exercise> exerciseList = [];

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
