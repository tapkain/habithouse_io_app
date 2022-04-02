import 'package:drift/drift.dart';
import 'package:habithouse_io/models/models.dart' as m;
import 'package:habithouse_io/repository/drift/database.dart';
import 'package:habithouse_io/util.dart';

class SharedPrefsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isFirstLaunch =>
      boolean().withDefault(const Constant(false))();
}

extension SharedPrefsTableCompanionX on m.SharedPrefs {
  SharedPrefsTableCompanion toCompanion() => SharedPrefsTableCompanion(
        id: id == autoIncrementId ? const Value.absent() : Value(id),
        isFirstLaunch: Value(isFirstLaunch),
      );
}
