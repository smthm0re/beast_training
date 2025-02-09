import 'package:beast_training/data/training_list_database.dart';
import 'package:beast_training/ui-kit/widgets/training_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrainingListWidget extends StatefulWidget {
  const TrainingListWidget({super.key});

  @override
  State<TrainingListWidget> createState() => _TrainingListWidgetState();
}

class _TrainingListWidgetState extends State<TrainingListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        height: 0.5,
        color: Color.fromARGB(255, 220, 223, 225),
      ),
      itemCount: trainingDataBase.trainingList.length,
      itemBuilder: (context, index) {
        final training = trainingDataBase.trainingList[index];
        return TrainingTileWidget(
          idTraining: "Тренировка № ${training.id}",
          dateTraining: DateFormat('dd.MM.yyyy').format(training.date),
          deleteTraining: (context) {
            setState(() {
              trainingDataBase.deleteTraining(index);
            });
          },
        );
      },
    );
  }
}
