import 'package:beast_training/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExerciseTileWidget extends StatelessWidget {
  final Exercise exercise;
  Function(BuildContext)? deleteTraining;

  ExerciseTileWidget({
    super.key,
    required this.exercise,
    required this.deleteTraining,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTraining,
            label: "УДАЛИТЬ",
            backgroundColor: Color.fromARGB(255, 235, 102, 91),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          exercise.name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          'Подходы: ${exercise.sets} Повторения: ${exercise.reps}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
