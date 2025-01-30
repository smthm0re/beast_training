import 'package:beast_training/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:beast_training/data/exercise_list_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TrainingStructureScreen extends StatefulWidget {
  const TrainingStructureScreen({super.key});

  @override
  State<TrainingStructureScreen> createState() =>
      _TrainingStructureScreenState();
}

class _TrainingStructureScreenState extends State<TrainingStructureScreen> {
  final _exerciseBox = Hive.box("exerciseBox");
  ExerciseListDataBase exerciseListDataBase = ExerciseListDataBase();

  String? idTraining;

  final List<String> allExercises = [
    'Жим лежа',
    'Выпады',
    'Становая тяга',
    'Подтягивания',
    'Подъем штанги',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (idTraining == null) {
      idTraining = ModalRoute.of(context)!.settings.arguments as String;

      if (_exerciseBox.get(idTraining) == null) {
        _exerciseBox.put(idTraining, []);
      } else {
        exerciseListDataBase.exerciseList = List<Exercise>.from(
          _exerciseBox.get(idTraining) ?? [],
        );
      }
      setState(() {});
    }
  }

  void addExercise(String name, int sets, int reps) {
    if (idTraining == null) return;

    final exercise = Exercise(name: name, sets: sets, reps: reps);

    setState(() {
      List<Exercise> exercises =
          List<Exercise>.from(_exerciseBox.get(idTraining) ?? []);
      exercises.add(exercise);
      _exerciseBox.put(idTraining, exercises);
      exerciseListDataBase.exerciseList = exercises;
    });
    Navigator.of(context).pop();
  }

  void showExercisePicker() {
    final setsController = TextEditingController();
    final repsController = TextEditingController();
    String selectedExercise = allExercises.first;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Выбор упражнения
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
                  setState(
                    () {
                      selectedExercise = value!;
                    },
                  );
                },
              ),

              // Ввод количества подходов
              TextField(
                controller: setsController,
                decoration: InputDecoration(labelText: 'Количество подходов'),
                keyboardType: TextInputType.number,
              ),

              // Ввод количества повторений
              TextField(
                controller: repsController,
                decoration: InputDecoration(labelText: 'Количество повторений'),
                keyboardType: TextInputType.number,
              ),

              // Кнопка для добавления упражнения
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
                    addExercise(selectedExercise, sets, reps);
                  }
                },
                child: const Text('Добавить упражнение'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(idTraining!),
      ),
      body: exerciseListDataBase.exerciseList.isEmpty
          ? const Center(child: Text('Добавьте упражнения'))
          : ListView.builder(
              itemCount: exerciseListDataBase.exerciseList.length,
              itemBuilder: (context, index) {
                final exercise = exerciseListDataBase.exerciseList[index];
                return ListTile(
                  title: Text(
                    exercise.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    'Подходы: ${exercise.sets} Повторения: ${exercise.reps}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        final String idTraining = ModalRoute.of(context)!
                            .settings
                            .arguments as String;
                        List<Exercise> exercises = List<Exercise>.from(
                            _exerciseBox.get(idTraining) ?? []);
                        exercises.removeAt(index);
                        _exerciseBox.put(idTraining, exercises);
                      });
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: showExercisePicker,
        tooltip: 'Добавить упражнение',
        child: const Icon(Icons.add),
      ),
    );
  }
}
