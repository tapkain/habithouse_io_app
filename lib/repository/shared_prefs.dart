import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

abstract class ISharedPrefs extends ChangeNotifier {
  bool get isFirstLaunch;

  @mustCallSuper
  Future<void> setFirstLaunch(bool value) async {
    notifyListeners();
  }

  ThemeMode get themeMode;

  @mustCallSuper
  Future<void> setThemeMode(ThemeMode themeMode) async {
    notifyListeners();
  }

  @mustCallSuper
  Future<void> onFirstLaunch(Function callback) async {
    if (isFirstLaunch) {
      callback();
      await setFirstLaunch(!isFirstLaunch);
    }
  }
}

final sharedPrefsProvider =
    ChangeNotifierProvider<ISharedPrefs>((_) => throw UnimplementedError());
