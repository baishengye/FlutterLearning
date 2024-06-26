import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class LocalStorage {

  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static get(String key,defaultValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key)??defaultValue;
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
