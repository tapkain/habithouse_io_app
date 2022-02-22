import 'dart:math';

import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

const bool kIsWeb = identical(0, 0.0);
String? testTempPath;

void registerBinaries() {
  if (!kIsWeb && testTempPath == null) {
    final dartToolDir = path.join(Directory.current.path, '.dart_tool');
    testTempPath = path.join(dartToolDir, 'test', 'tmp');
    try {
      Isar.initializeLibraries(
        libraries: {
          'windows': path.join(dartToolDir, 'libisar_windows_x64.dll'),
          'macos': path.join(dartToolDir, 'libisar_macos_x64.dylib'),
          'linux': path.join(dartToolDir, 'libisar_linux_x64.so'),
        },
      );
    } catch (e) {
      // ignore. maybe this is an instrumentation test
    }
  }
}

String getRandomName() {
  var random = Random().nextInt(pow(2, 32) as int).toString();
  return '${random}_tmp';
}

Future<Isar> openTempIsar(List<CollectionSchema<dynamic>> schemas,
    {String? name}) async {
  registerBinaries();

  return Isar.open(
    schemas: schemas,
    name: name ?? getRandomName(),
    directory: kIsWeb ? '' : testTempPath!,
  );
}
