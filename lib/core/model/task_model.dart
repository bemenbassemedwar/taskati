import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';
@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String title;
  @ HiveField(1)
  final String note;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String startTime;
  @HiveField(4)
  final String endTime;
  @HiveField(5)
  final int color;
  @HiveField(6)
  final bool isCompleted;
  @HiveField(7)
  final String id;

  TaskModel(
      {required this.title,
      required this.note,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.color,
      required this.isCompleted,
      required this.id});
}
