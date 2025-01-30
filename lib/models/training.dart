import 'package:hive_flutter/hive_flutter.dart';

part 'training.g.dart';

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