import 'package:beast_training/beast_training_app.dart';
import 'package:beast_training/models/exercise.dart';
import 'package:beast_training/models/training.dart';
import 'package:beast_training/ui-kit/notification_service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TrainingAdapter());
  Hive.registerAdapter(ExerciseAdapter());
  await Hive.openBox("defaultBox");
  await Hive.openBox("exerciseBox");

  await notificationService.init();

  runApp(const BeastTrainingApp());
}
