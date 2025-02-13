import 'package:beast_training/data/training_list_database.dart';
import 'package:beast_training/ui-kit/notification_service/notification_service.dart';
import 'package:beast_training/ui-kit/widgets/logo_image_widget.dart';
import 'package:beast_training/ui-kit/widgets/notification_time_picker.dart';
import 'package:beast_training/ui-kit/widgets/notification_widget.dart';
import 'package:beast_training/ui-kit/widgets/text_center_widget.dart';
import 'package:beast_training/ui-kit/widgets/training_list_widget.dart';
import 'package:flutter/material.dart';

class TrainingListScreen extends StatefulWidget {
  const TrainingListScreen({super.key});

  @override
  State<TrainingListScreen> createState() => _TrainingListScreenState();
}

class _TrainingListScreenState extends State<TrainingListScreen> {
  @override
  void initState() {
    trainingDataBase.initializeData();
    notificationService.requestNotificationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BeastTrainingApp'),
        actions: [
          NotificationWidget(),
          NotificationTimePicker(
            notificationService: notificationService,
            notificationTitle: 'Напоминание',
            notificationBody: 'Не забудьте выполнить тренировку!',
          ),
        ],
      ),
      body: Column(
        children: [
          LogoImageWidget(
            colorBackground: Color.fromARGB(255, 241, 241, 241),
            imageSize: 150,
          ),
          TextCenterWidget(
            colorBackground: Color.fromARGB(255, 241, 241, 241),
            text: 'Список тренировок',
          ),
          Expanded(
            child: TrainingListWidget(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Добавить тренировку',
        child: const Icon(Icons.add_circle),
        onPressed: () {
          setState(() {
            trainingDataBase.addTraining();
          });
        },
      ),
    );
  }
}
