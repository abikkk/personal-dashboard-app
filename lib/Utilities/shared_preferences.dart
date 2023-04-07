import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  // static getter
  static Future<String?> getString(String key) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    final SharedPreferences prefInstance = await pref;
    return prefInstance.getString(key);
  }

  static Future<int?> getInt(String key) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    final SharedPreferences prefInstance = await pref;
    return prefInstance.getInt(key);
  }

  static Future<bool?> getBool(String key) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    final SharedPreferences prefInstance = await pref;
    return prefInstance.getBool(key);
  }

  static Future<double?> getDouble(String key) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    final SharedPreferences prefInstance = await pref;
    return prefInstance.getDouble(key);
  }

  static Future<List<String>?> getStringList(String key) async{
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    final SharedPreferences prefInstance = await pref;
    return prefInstance.getStringList(key);
  }

  // setter
  static setString(String key, String value) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    final SharedPreferences prefInstance = await pref;
    prefInstance.setString(key, value);
  }

  static setInt(String key, int value) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    final SharedPreferences prefInstance = await pref;
    prefInstance.setInt(key, value);
  }

  static setBool(String key, bool value) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    final SharedPreferences prefInstance = await pref;
    prefInstance.setBool(key, value);
  }

  static setDouble(String key, double value) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    final SharedPreferences prefInstance = await pref;
    prefInstance.setDouble(key, value);
  }

  static setStringList(String key, List<String> value) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    final SharedPreferences prefInstance = await pref;
    prefInstance.setStringList(key, value);
  }
}
