import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("Name", name);
  }

  static Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Name") ?? "";
  }

  static Future<void> savePwd(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("Password", name);
  }

  static Future<String> getPwd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Password") ?? "";
  }
}
