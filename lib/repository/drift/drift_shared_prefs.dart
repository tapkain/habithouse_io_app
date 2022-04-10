import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/repository/drift/database.dart';
import 'package:habithouse_io/repository/repository.dart';
import 'package:habithouse_io/util.dart';

class DriftSharedPrefs extends ISharedPrefs {
  DriftSharedPrefs(this.db);

  final AppDb db;
  late SharedPrefsTableData _data;

  @override
  Future<void> onFirstLaunch(Function callback) async {
    _data = await _fetchPrefs();
    return super.onFirstLaunch(callback);
  }

  @override
  bool get isFirstLaunch => _data.isFirstLaunch;

  @override
  Future<void> setFirstLaunch(bool value) async {
    await _putPrefs(_data.copyWith(isFirstLaunch: value));
    return super.setFirstLaunch(value);
  }

  Future<void> _putPrefs(SharedPrefsTableData data) async {
    final id = await db.into(db.sharedPrefsTable).insertOnConflictUpdate(
          data.toCompanion(true).copyWith(
                id: data.id == autoIncrementId
                    ? const Value.absent()
                    : Value(data.id),
              ),
        );
    _data = data.copyWith(id: id);
  }

  Future<SharedPrefsTableData> _fetchPrefs() =>
      db.select(db.sharedPrefsTable).getSingleOrNull().then((value) {
        if (value == null) {
          return SharedPrefsTableData(
            id: autoIncrementId,
            isFirstLaunch: true,
            themeMode: ThemeMode.system,
          );
        }

        return value;
      });

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _putPrefs(_data.copyWith(themeMode: themeMode));
    return super.setThemeMode(themeMode);
  }

  @override
  ThemeMode get themeMode => _data.themeMode;
}
