import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

Color getRandomColor() =>
    Colors.primaries[Random().nextInt(Colors.primaries.length - 1)];

Emoji getRandomEmoji() {
  const emojis = ['🌟', '🎯', '🧘', '📚', '🪴', '👀', '💅', '🌇', '📲'];
  return Emoji('random', emojis[Random().nextInt(emojis.length - 1)]);
}
