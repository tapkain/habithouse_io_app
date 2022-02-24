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
    // local isar db unique autoincrement id
    @Default(isarAutoIncrementId) @Id() int id,

    // used for distinquishing templated habits vs user generated ones
    int? templateId,

    // if null, habit is a routine which contains other habits
    int? parentId,
    required String name,
    required DateTime createdAt,

    // duration of habit in seconds
    int? durationSeconds,
    String? description,
    @Default(false) bool isArchived,
    String? emojiIcon,

    // time during the day when app will notify about the routine
    List<DateTime>? reminders,

    // list of file uris
    List<String>? localFileAttachmentUris,

    // cron string to know how often to repeat this habit (daily, weekly, every monday etc)
    String? repeatCron,
    String? targetGoal,
    int? backgroundColor,
  }) = _Habit;

  static Habit fromCreateHabitForm(CreateHabitForm form) => Habit(
        name: form.nameValue,
        createdAt: DateTime.now(),
      );

  CreateHabit createHabitFormModel() => CreateHabit(name: name);

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

  CreateChildHabit createChildHabitFormModel() => CreateChildHabit(name: name);
}
