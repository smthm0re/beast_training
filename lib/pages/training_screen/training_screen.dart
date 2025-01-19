import 'package:beast_training/data/database.dart';
import 'package:beast_training/pages/training_screen/dialog_box/dialog_box.dart';
import 'package:beast_training/pages/training_screen/training_tile/training_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  final _trainingBox = Hive.box("trainingBox");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_trainingBox.get("TRAININGLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void _createNewTraining() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTraining,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
    setState(() {});
  }

  void saveNewTraining() {
    db.trainingList.add(_controller.text);
    db.updateDataBase();
    Navigator.of(context).pop();
    _controller.clear();
    setState(() {});
  }

  void deleteTraining(int index) {
    db.trainingList.removeAt(index);
    db.updateDataBase();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BEAST TRAINING'),
      ),
      body: ListView.builder(
        itemCount: db.trainingList.length,
        itemBuilder: (context, index) {
          return TrainingTile(
            trainingNumber: db.trainingList[index],
            deleteTraining: (context) => deleteTraining(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewTraining,
        tooltip: 'Добавить тренировку',
        child: const Icon(Icons.add),
      ),
    );
  }
}
