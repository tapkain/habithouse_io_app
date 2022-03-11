import 'package:habithouse_io/models/habit.dart';

final templateHabits = [
  Habit(
    templateId: 'Meditation'.hashCode,
    name: 'Meditation',
    createdAt: DateTime.now(),
    description: 'meditation is good for your mind',
    emojiIcon: '🧘',
  ),
  Habit(
    templateId: 'Cold Shower'.hashCode,
    name: 'Cold Shower',
    createdAt: DateTime.now(),
    description: 'cold shower is refreshing',
    emojiIcon: '🚿',
  ),
  Habit(
    templateId: 'Drink Water'.hashCode,
    name: 'Drink Water',
    createdAt: DateTime.now(),
    description: 'You need to be hydrated!',
    emojiIcon: '💧',
  ),
  Habit(
    templateId: 'Eat a great breakfast'.hashCode,
    name: 'Eat a great breakfast',
    createdAt: DateTime.now(),
    description: 'The most important meal of the day',
    emojiIcon: '🍽',
  ),
  Habit(
    templateId: 'Excercise'.hashCode,
    name: 'Excercise',
    createdAt: DateTime.now(),
    durationSeconds: 8 * 60,
    description: 'Energize your body',
    emojiIcon: '🤸',
  ),
];
