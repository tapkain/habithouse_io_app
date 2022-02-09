import 'package:habithouse_io/config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

final isarProvider = Provider((_) => Isar.getInstance(Config.localDbName)!);
