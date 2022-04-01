import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habithouse_io/util.dart';

part 'shared_prefs.freezed.dart';
part 'shared_prefs.g.dart';

@freezed
class SharedPrefs with _$SharedPrefs {
  const factory SharedPrefs({
    @Default(autoIncrementId) int id,
    @Default(true) bool isFirstLaunch,
  }) = _SharedPrefs;

  factory SharedPrefs.fromJson(Map<String, dynamic> json) =>
      _$SharedPrefsFromJson(json);
}
