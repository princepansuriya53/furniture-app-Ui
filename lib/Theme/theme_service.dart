import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const String _keyIsDarkMode = 'isDarkMode';
  static const String keyPrimaryColor = 'primaryColor';

  // Load saved theme mode (dark or light)
  Future<bool> loadIsDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsDarkMode) ??
        PlatformDispatcher.instance.platformBrightness == Brightness.dark;
  }

  // Save theme mode
  Future<void> saveIsDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsDarkMode, isDarkMode);
  }

  // Load primary color
  Future<Color?> loadPrimaryColor() async {
    final prefs = await SharedPreferences.getInstance();
    final int? colorValue = prefs.getInt(keyPrimaryColor);
    return colorValue != null ? Color(colorValue) : null;
  }

  // Save primary color
  Future<void> savePrimaryColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(keyPrimaryColor, color.value);
  }
}
