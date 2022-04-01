import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/models/models.dart';

List<Habit> generateHabits(DateTime now) => [
      Habit(
        name: 'now + 3.days; now + 30 days',
        createdAt: now,
        startDate: now + 3.days,
        endDate: now + 30.days,
        emojiIcon: '🔥',
        backgroundColor: Colors.red.value,
      ),
      Habit(
        name: 'now - 30.days; now - 2.days',
        createdAt: now - 31.days,
        startDate: now - 30.days,
        endDate: now - 2.days,
        emojiIcon: '🔥',
        backgroundColor: Colors.blue.value,
      ),
      Habit(
        name: 'now; never',
        createdAt: now - 2.days,
        startDate: now - 1.days,
        emojiIcon: '🔥',
        backgroundColor: Colors.yellow.value,
      ),
      Habit(
        name: 'now - 5.days ; now + 5.days',
        createdAt: now - 6.days,
        startDate: now - 5.days,
        endDate: now + 5.days,
        emojiIcon: '🔥',
        backgroundColor: Colors.deepPurple.value,
      ),
    ];
