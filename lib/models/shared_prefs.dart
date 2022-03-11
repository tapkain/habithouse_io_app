import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'shared_prefs.freezed.dart';
part 'shared_prefs.g.dart';

@freezed
@Collection()
class SharedPrefs with _$SharedPrefs {
  const factory SharedPrefs({
    @Default(isarAutoIncrementId) @Id() int id,
    @Default(true) bool isFirstLaunch,
  }) = _SharedPrefs;
}
