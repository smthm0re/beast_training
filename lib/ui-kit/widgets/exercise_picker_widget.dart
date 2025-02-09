import 'package:beast_training/data/exercise_list_database.dart';
import 'package:flutter/material.dart';

class ExercisePickerWidget extends StatelessWidget {
  final String idTraining;
  final Function(String, int, int) onExerciseAdded;

  const ExercisePickerWidget({
    super.key,
    required this.idTraining,
    required this.onExerciseAdded,
  });

  @override
  Widget build(BuildContext context) {
    final setsController = TextEditingController();
    final repsController = TextEditingController();
    String selectedExercise = allExercises.first;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration:
                InputDecoration(labelText: 'Выберите упражнение из списка'),
                items: allExercises.map(
                      (exercise) {
                    return DropdownMenuItem(
                      value: exercise,
                      child: Text(exercise),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                      selectedExercise = value!;
                },
              ),
              TextField(
                controller: setsController,
                decoration: InputDecoration(labelText: 'Количество подходов'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: repsController,
                decoration: InputDecoration(labelText: 'Количество повторений'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () {
                  final sets = int.tryParse(setsController.text);
                  final reps = int.tryParse(repsController.text);

                  if (sets == null || reps == null || sets <= 0 || reps <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Введите корректные значения'),
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    onExerciseAdded(
                      selectedExercise,
                      sets,
                      reps,
                    );
                      Navigator.pop(context);
                    }
                },
                child: const Text('Добавить упражнение'),
              ),
            ],
          ),
        );
      }
    }

