import 'package:isar/isar.dart';

part 'habit.g.dart';

@Collection()
class Habit {
  int id = Isar.autoIncrement;
  int? parentId;
  late String name;
  DateTime? createdAt;
  String? description;
  bool isArchived = false;
  String? emojiIcon;
  List<DateTime>? reminders;
  String? repeatCron;
  String? targetGoal;
}
