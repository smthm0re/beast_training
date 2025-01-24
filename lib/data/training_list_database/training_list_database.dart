import 'package:hive_flutter/hive_flutter.dart';

part 'training_list_database.g.dart';

@HiveType(typeId: 1)
class Training {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final DateTime date;

  Training({
    required this.id,
    required this.date,
  });
}

class TrainingListDataBase {
  List trainingList = [];

  final _trainingBox = Hive.box("defaultBox");

  void createInitialData() {
    trainingList = [
      Training(
        id: 1,
        date: DateTime.now(),
      ),
    ];
  }

  void loadData() {
    trainingList = _trainingBox.get("trainingListBox");
  }

  void updateDataBase() {
    _trainingBox.put("trainingListBox", trainingList);
  }
}
