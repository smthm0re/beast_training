import 'package:beast_training/app/beast_training_app.dart';
import 'package:beast_training/data/training_list_database/training_list_database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(TrainingAdapter());

  var box = await Hive.openBox("defaultBox");
  
  runApp(const BeastTrainingApp());
}
