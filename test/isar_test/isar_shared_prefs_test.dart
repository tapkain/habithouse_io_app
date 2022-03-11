import 'package:flutter_test/flutter_test.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/repository/repository.dart';
import 'package:isar/isar.dart';
import 'common.dart';

void main() {
  group('Isar shared prefs', () {
    late Isar isar;
    late IsarSharedPrefs isarPrefs;

    setUp(() async {
      isar = await openTempIsar([SharedPrefsSchema]);
      isarPrefs = IsarSharedPrefs(isar);
    });

    tearDown(() async {
      await isar.close();
    });

    test('isFirstLaunch should be true on first fetch', () async {
      expect(await isarPrefs.isFirstLaunch(), equals(true));
    });

    test('isFirstLaunch should be modifiable', () async {
      final isFirstLaunch = await isarPrefs.isFirstLaunch();
      expect(isFirstLaunch, equals(true));
      await isarPrefs.setFirstLaunch(!isFirstLaunch);
      expect(await isarPrefs.isFirstLaunch(), equals(!isFirstLaunch));
    });
  });
}
