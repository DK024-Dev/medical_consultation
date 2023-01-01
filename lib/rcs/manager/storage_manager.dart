import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  factory StorageManager() {
    return _singleton;
  }
  StorageManager._internal();
  static final StorageManager _singleton = StorageManager._internal();

  late SharedPreferences _storagePrefs;

  Future get initializeSharedPreference async =>
      await SharedPreferences.getInstance()
          .then((SharedPreferences prefs) async => _storagePrefs = prefs);

  // Future setDrawerIndex(int index) async {
  //   await _storagePrefs.setInt('drawer_index', index);
  // }

  // int get getDrawerIndex => _storagePrefs.getInt('drawer_index') ?? 0;

  Future get clearPreferance async => _storagePrefs.clear();
}
