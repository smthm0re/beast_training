import 'package:beast_training/app/beast_training_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runApp(const BeastTrainingApp());
  await Hive.initFlutter();
}
