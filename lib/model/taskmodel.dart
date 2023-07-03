import 'package:hive/hive.dart';

part "taskmodel.g.dart";

@HiveType(typeId: 0)
class task extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? note;

  @HiveField(2)
  DateTime? creation_time;

  @HiveField(3)
  bool? done;

  task({this.title, this.note, this.creation_time, this.done});
}
