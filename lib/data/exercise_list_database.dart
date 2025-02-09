import 'package:beast_training/models/exercise.dart';
import 'package:beast_training/ui-kit/widgets/exercise_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ExerciseListDataBase exerciseListDataBase = ExerciseListDataBase();

final List<String> allExercises = [
  'Жим лежа',
  'Выпады',
  'Становая тяга',
  'Подтягивания',
  'Подъем штанги',
];

class ExerciseListDataBase {
  final _exerciseBox = Hive.box('exerciseBox');

  void addExercise(String idTraining, String name, int sets, int reps) {
    final exercise = Exercise(name: name, sets: sets, reps: reps);
    List<Exercise> exercises =
        List<Exercise>.from(_exerciseBox.get(idTraining) ?? []);
    exercises.add(exercise);
    _exerciseBox.put(idTraining, exercises);
  }

  void showExercisePicker({
    required BuildContext context,
    required String idTraining,
    required Function(String name, int sets, int reps) onExerciseAdded,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ExercisePickerWidget(
            idTraining: idTraining, onExerciseAdded: onExerciseAdded);
      },
    );
  }
}
