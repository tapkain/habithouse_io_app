import 'package:habithouse_io/models/habit.dart';

final templateHabits = [
  Habit(
    name: 'Meditation',
    createdAt: DateTime.now(),
    startDate: DateTime.now(),
    description: 'meditation is good for your mind',
    emojiIcon: '🧘',
  ),
  Habit(
    name: 'Cold Shower',
    createdAt: DateTime.now(),
    startDate: DateTime.now(),
    description: 'cold shower is refreshing',
    emojiIcon: '🚿',
  ),
  Habit(
    name: 'Drink Water',
    createdAt: DateTime.now(),
    startDate: DateTime.now(),
    description: 'You need to be hydrated!',
    emojiIcon: '💧',
  ),
  Habit(
    name: 'Eat a great breakfast',
    createdAt: DateTime.now(),
    startDate: DateTime.now(),
    description: 'The most important meal of the day',
    emojiIcon: '🍽',
  ),
  Habit(
    name: 'Excercise',
    createdAt: DateTime.now(),
    startDate: DateTime.now(),
    durationSeconds: 8 * 60,
    description: 'Energize your body',
    emojiIcon: '🤸',
  ),
];
