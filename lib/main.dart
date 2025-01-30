import 'package:beast_training/app/beast_training_app.dart';
import 'package:beast_training/models/exercise.dart';
import 'package:beast_training/models/training.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(TrainingAdapter());
  Hive.registerAdapter(ExerciseAdapter());

  await Hive.openBox("defaultBox");
  await Hive.openBox("exerciseBox");
  
  runApp(const BeastTrainingApp());
}
