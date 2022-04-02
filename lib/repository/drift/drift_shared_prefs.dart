import 'package:habithouse_io/models/shared_prefs.dart';
import 'package:habithouse_io/repository/repository.dart';
import 'shared_prefs_table.dart';

class DriftSharedPrefs extends ISharedPrefs {
  DriftSharedPrefs(this.db);

  final AppDb db;

  @override
  Future<bool> isFirstLaunch() async {
    final prefs = await _fetchPrefs();
    return prefs.isFirstLaunch;
  }

  @override
  Future<void> setFirstLaunch(bool value) async {
    final prefs = await _fetchPrefs();
    await db.into(db.sharedPrefsTable).insertOnConflictUpdate(
          prefs.copyWith(isFirstLaunch: value).toCompanion(),
        );
  }

  Future<SharedPrefs> _fetchPrefs() =>
      db.select(db.sharedPrefsTable).getSingleOrNull().then((value) {
        if (value == null) {
          return const SharedPrefs();
        }

        return SharedPrefs.fromJson(value.toJson());
      });
}
