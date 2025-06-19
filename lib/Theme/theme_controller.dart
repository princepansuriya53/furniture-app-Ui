import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final RxBool isDarkMode = false.obs;

  final Rx<Color> primaryColor = const Color(0xFFFCD240).obs;

  Color lightSecondaryColour = const Color(0xFF3B82F6);
  Color darkSecondaryColour = const Color(0x4D0A1F44);

  final Color greyColor = Colors.grey;
  final Color blackColor = Colors.black;
  final Color whiteColor = Colors.white;

  final Color offWhiteColor = Color(0xFFFFF9E4);

  final Color appBar1Color = Color(0xFF0F172A);
  final Color appBar2Color = Color(0xFF1E3A8A);
  final Color appBar3Color = Color(0xFF172554);
  final Color borderColor = Color(0xFF3B82F6);
  final Color dialogBGColor1 = Color(0xFF1A1A2E);
  final Color dialogBGColor2 = Color(0xFF16213E);

  final Color otherUserColor1 = Color(0xFF374151);
  final Color otherUserColor2 = Color(0xFF1F2937);

  final Color myUserColor1 = Color(0xFF3B82F6);
  final Color myUserColor2 = Color(0xFF60A5FA);

  @override
  void onInit() {
    super.onInit();
    initializeTheme();
  }

  Future<void> initializeTheme() async {
    await loadPreferences();
    applyColorSet1();
    updateTheme();
    updateStatusBar();
  }

  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value =
        prefs.getBool('isDarkMode') ??
        PlatformDispatcher.instance.platformBrightness == Brightness.dark;
    // isDarkMode.value = true;

    final int? savedColor = prefs.getInt('primaryColor');
    if (savedColor != null) {
      primaryColor.value = Color(savedColor);
    }
  }

  // Toggle dark/light mode
  void toggleTheme() async {
    isDarkMode.toggle();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode.value);
    updateTheme();
    updateStatusBar();
  }

  // Change primary color and persist it
  void setPrimaryColor(Color color) async {
    primaryColor.value = color;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('primaryColor', color.value);
    updateTheme();
  }

  // Apply the selected theme to GetX
  void updateTheme() {
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }

  // Update status bar style based on theme
  void updateStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: isDarkMode.value
            ? Brightness.light
            : Brightness.dark,
        statusBarIconBrightness: isDarkMode.value
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }

  void applyColorSet1() {
    primaryColor.value = blackColor;
    lightSecondaryColour = offWhiteColor;
    darkSecondaryColour = const Color(0x4D0A1F44);
  }

  Color get currentSecondaryColour =>
      isDarkMode.value ? darkSecondaryColour : lightSecondaryColour;

  // Light theme definition
  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor.value,
    scaffoldBackgroundColor: const Color(0xFFF0F1F3),
    dialogTheme: DialogThemeData(
      backgroundColor: const Color(0xFFF0F1F3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: whiteColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0.5,
      shadowColor: greyColor.withValues(alpha: 0.5),
    ),
    colorScheme: ColorScheme.light(
      primary: primaryColor.value,
      secondary: lightSecondaryColour,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(primaryColor.value),
      ),
    ),
    hintColor: blackColor,
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(whiteColor),
      overlayColor: WidgetStateProperty.all(primaryColor.value),
    ),
    cardTheme: CardThemeData(
      elevation: 4,
      color: whiteColor,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: const Color(0xFFFFFFFF),
      selectedColor: primaryColor.value,
      textColor: blackColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
    ),
  );

  // Dark theme definition
  ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: whiteColor,
    ),
    primaryColor: primaryColor.value,
    scaffoldBackgroundColor: blackColor,

    dialogTheme: DialogThemeData(
      backgroundColor: blackColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: blackColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0.5,
      shadowColor: Colors.black.withValues(alpha: 0.5),
    ),

    colorScheme: ColorScheme.dark(
      primary: primaryColor.value,
      secondary: darkSecondaryColour,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkSecondaryColour,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(primaryColor.value),
      ),
    ),
    hintColor: greyColor,
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(blackColor),
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFF1E1E1E),
      shadowColor: Colors.black.withValues(alpha: 0.5),
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: const Color(0xFF1E1E1E),
      selectedColor: primaryColor.value,
      textColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
    ),
  );
}
