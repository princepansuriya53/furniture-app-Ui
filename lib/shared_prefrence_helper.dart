import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static late SharedPreferences preferences;

  // Initialize SharedPreferences once
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  // Set a boolean value
  static Future<void> setBool(String key, bool value) async {
    await preferences.setBool(key, value);
  }

  // Get a boolean value
  static bool getBool(String key, {bool defaultValue = false}) {
    return preferences.getBool(key) ?? defaultValue;
  }

  // Set a string value
  static Future<void> setString(String key, String value) async {
    await preferences.setString(key, value);
  }

  // Get a string value
  static String getString(String key, {String defaultValue = ''}) {
    return preferences.getString(key) ?? defaultValue;
  }

  // Set an integer value
  static Future<void> setInt(String key, int value) async {
    await preferences.setInt(key, value);
  }

  // Get an integer value
  static int getInt(String key, {int defaultValue = 0}) {
    return preferences.getInt(key) ?? defaultValue;
  }

  // Set a list of strings
  static Future<void> setStringList(String key, List<String> value) async {
    await preferences.setStringList(key, value);
  }

  // Get a list of strings
  static List<String> getStringList(
    String key, {
    List<String> defaultValue = const [],
  }) {
    return preferences.getStringList(key) ?? defaultValue;
  }

  // Remove a key-value pair
  static Future<void> remove(String key) async {
    await preferences.remove(key);
  }

  // Clear all data
  static Future<void> clearAll() async {
    await preferences.clear();
  }
}
