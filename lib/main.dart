import 'package:beast_training/apps/beast_training_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('trainingBox');

  runApp(const BeastTrainingApp());
}
