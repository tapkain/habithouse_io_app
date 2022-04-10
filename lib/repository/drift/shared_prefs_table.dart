import 'package:drift/drift.dart';
import 'package:flutter/material.dart' as material;

class SharedPrefsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isFirstLaunch =>
      boolean().withDefault(const Constant(false))();
  IntColumn get themeMode => intEnum<material.ThemeMode>()();
}
