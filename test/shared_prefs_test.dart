import 'package:flutter_test/flutter_test.dart';
import 'package:habithouse_io/repository/repository.dart';

void main() {
  group('Isar shared prefs', () {
    late AppDb db;
    late ISharedPrefs prefs;

    setUp(() async {
      db = AppDb(transientDb: true, populateDb: false, logStatements: false);
      prefs = DriftSharedPrefs(db);
    });

    tearDown(() async {
      await db.close();
    });

    test('isFirstLaunch should be true on first fetch', () async {
      expect(await prefs.isFirstLaunch(), equals(true));
    });

    test('isFirstLaunch should be modifiable', () async {
      final isFirstLaunch = await prefs.isFirstLaunch();
      expect(isFirstLaunch, equals(true));
      await prefs.setFirstLaunch(!isFirstLaunch);
      expect(await prefs.isFirstLaunch(), equals(!isFirstLaunch));
    });
  });
}
