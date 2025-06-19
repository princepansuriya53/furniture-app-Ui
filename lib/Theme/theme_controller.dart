import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/Theme/theme_service.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final RxBool isDarkMode = false.obs;
  final ThemeService themeService = ThemeService();
  final Rx<Color> primaryColor = const Color(0xFFFCD240).obs;

  Color lightSecondaryColour = const Color(0xFF3B82F6);
  Color darkSecondaryColour = const Color(0x4D0A1F44);

  final Color greyColor = Colors.grey;
  final Color blackColor = Colors.black;
  final Color whiteColor = Colors.white;
  final Color offWhiteColor = const Color(0xFFFFF9E4);

  final Color appBar1Color = const Color(0xFF0F172A);
  final Color appBar2Color = const Color(0xFF1E3A8A);
  final Color appBar3Color = const Color(0xFF172554);
  final Color borderColor = const Color(0xFF3B82F6);
  final Color dialogBGColor1 = const Color(0xFF1A1A2E);
  final Color dialogBGColor2 = const Color(0xFF16213E);

  final Color otherUserColor1 = const Color(0xFF374151);
  final Color otherUserColor2 = const Color(0xFF1F2937);
  final Color myUserColor1 = const Color(0xFF3B82F6);
  final Color myUserColor2 = const Color(0xFF60A5FA);

  @override
  void onInit() {
    super.onInit();
    initializeTheme();
  }

  Future<void> initializeTheme() async {
    isDarkMode.value = await themeService.loadIsDarkMode();
    Color? savedColor = await themeService.loadPrimaryColor();
    if (savedColor != null) {
      primaryColor.value = savedColor;
    }
    applyColorSet1();
    updateTheme();
    updateStatusBar();
  }

  void toggleTheme() async {
    isDarkMode.toggle();
    await themeService.saveIsDarkMode(isDarkMode.value);
    updateTheme();
    updateStatusBar();
  }

  void setPrimaryColor(Color color) async {
    primaryColor.value = color;
    await themeService.savePrimaryColor(color);
    updateTheme();
  }

  void updateTheme() {
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }

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
      shadowColor: greyColor.withAlpha(80),
    ),
    colorScheme: ColorScheme.light(
      primary: primaryColor.value,
      secondary: lightSecondaryColour,
    ),
    inputDecorationTheme: const InputDecorationTheme(
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
      shadowColor: Colors.black.withAlpha(80),
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
      shadowColor: Colors.black.withAlpha(80),
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
