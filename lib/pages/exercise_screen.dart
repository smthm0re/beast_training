import 'package:beast_training/models/exercise.dart';
import 'package:beast_training/ui-kit/widgets/exercise_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:beast_training/data/exercise_list_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final _exerciseBox = Hive.box("exerciseBox");
  String? idTraining;
  List<Exercise> exercises = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    idTraining = ModalRoute.of(context)!.settings.arguments as String?;
    if (idTraining != null) {
      exercises = List<Exercise>.from(_exerciseBox.get(idTraining) ?? []);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(idTraining!),
      ),
      body: exercises.isEmpty
          ? const Center(child: Text('Добавьте упражнения'))
          : ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return ExerciseTileWidget(
                  exercise: exercise,
                  deleteTraining: (context) {
                    setState(() {
                      exercises.removeAt(index);
                      _exerciseBox.put(idTraining, exercises);
                    });
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          exerciseListDataBase.showExercisePicker(
            context: context,
            idTraining: idTraining!,
            onExerciseAdded: (name, sets, reps) {
              setState(() {
                final newExercise =
                    Exercise(name: name, sets: sets, reps: reps);
                exercises.add(newExercise);
              });
              _exerciseBox.put(idTraining, exercises);
            },
          );
        },
        tooltip: 'Добавить упражнение',
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
