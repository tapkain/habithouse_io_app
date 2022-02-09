import 'package:habithouse_io/models/habit.dart';
import 'package:isar/isar.dart';

part 'habit_entry.g.dart';

@Collection()
class HabitEntry {
  int id = Isar.autoIncrement;
  late int habitId;
  late DateTime createdAt;
  String? targetGoal;
}
