import 'package:beast_training/data/training_list_database.dart';
import 'package:beast_training/ui-kit/widgets/logo_image_widget.dart';
import 'package:beast_training/ui-kit/widgets/text_center_widget.dart';
import 'package:beast_training/ui-kit/widgets/training_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TrainingListScreen extends StatefulWidget {
  const TrainingListScreen({super.key});

  @override
  State<TrainingListScreen> createState() => _TrainingListScreenState();
}

class _TrainingListScreenState extends State<TrainingListScreen> {
  final _trainingBox = Hive.box("defaultBox");

  @override
  void initState() {
    if (_trainingBox.get("trainingListBox") == null) {
      trainingDataBase.createInitialData();
    } else {
      trainingDataBase.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BeastTrainingApp'),
      ),
      body: Column(
        children: [
          LogoImageWidget(
            color: Color.fromARGB(255, 241, 241, 241),
            imageWidth: 150,
            imageHeight: 150,
          ),
          TextCenterWidget(
            color: Color.fromARGB(255, 241, 241, 241),
            text: 'Список тренировок',
          ),
          Expanded(
            child: TrainingListWidget(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            trainingDataBase.addTraining();
          });
        },
        tooltip: 'Добавить тренировку',
        elevation: 4,
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
