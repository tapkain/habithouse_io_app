import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/repository/shared_prefs.dart';
import 'package:isar/isar.dart';

class IsarSharedPrefs extends ISharedPrefs {
  IsarSharedPrefs(this._isar);

  @override
  Future<bool> isFirstLaunch() async => (await _fetchPrefs()).isFirstLaunch;

  final Isar _isar;

  @override
  Future<void> setFirstLaunch(bool value) async {
    final prefs = await _fetchPrefs();
    await _isar.writeTxn(
      (isar) => isar.sharedPrefss.put(
        prefs.copyWith(isFirstLaunch: value),
      ),
    );
  }

  Future<SharedPrefs> _fetchPrefs() async =>
      await _isar.sharedPrefss
          .filter()
          .idGreaterThan(isarAutoIncrementId, include: true)
          .findFirst() ??
      const SharedPrefs();
}
