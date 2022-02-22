import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habithouse_io/models/create_child_habit_form.dart';
import 'package:habithouse_io/models/create_habit_form.dart';
import 'package:isar/isar.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
@Collection()
class Habit with _$Habit {
  const Habit._();

  const factory Habit({
    @Default(isarAutoIncrementId) @Id() int id,
    int? parentId,
    required String name,
    required DateTime createdAt,
    String? description,
    @Default(false) bool isArchived,
    String? emojiIcon,
    List<DateTime>? reminders,
    String? repeatCron,
    String? targetGoal,
  }) = _Habit;

  static Habit fromCreateHabitForm(CreateHabitForm form) => Habit(
        name: form.nameValue,
        createdAt: DateTime.now(),
      );

  Habit copyWithCreateHabitForm(CreateHabitForm form) => copyWith(
        name: form.nameValue,
      );

  static Habit fromCreateChildHabitForm(
    CreateChildHabitForm form,
    int parentId,
  ) =>
      Habit(
        name: form.nameValue,
        createdAt: DateTime.now(),
        parentId: parentId,
      );

  Habit copyWithCreateChildHabitForm(CreateChildHabitForm form, int parentId) =>
      copyWith(
        name: form.nameValue,
        parentId: parentId,
      );
}
