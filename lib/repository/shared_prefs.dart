import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ISharedPrefs {
  Future<bool> isFirstLaunch();
  Future<void> setFirstLaunch(bool value);

  Future<void> onFirstLaunch(Function callback) async {
    final value = await isFirstLaunch();
    if (value) {
      callback();
      await setFirstLaunch(!value);
    }
  }
}

final sharedPrefsProvider =
    Provider<ISharedPrefs>((_) => throw UnimplementedError());
