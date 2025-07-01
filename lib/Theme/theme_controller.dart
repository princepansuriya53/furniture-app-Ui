import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Theme/theme_service.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final RxBool isDarkMode = false.obs;
  final ThemeService themeService = ThemeService();
  final Rx<Color> secondaryColors = const Color.fromARGB(
    255,
    223,
    198,
    108,
  ).obs;

  Color lightSecondaryColour = const Color(0xFF3B82F6);
  Color darkSecondaryColour = const Color(0x4D0A1F44);

  final Color greyColor = Colors.grey;
  final Color blackColor = Colors.black;
  final Color primaryColor = Color(0xFFFCD240);
  final Color whiteColor = Colors.white;
  final Color ErrorColor = Colors.red;
  final Color offWhiteColor = const Color(0xFFFFF9E4);
  final Color GreayColor = const Color(0xFFEFEFEF);

  @override
  void onInit() {
    super.onInit();
    initializeTheme();
  }

  Future<void> initializeTheme() async {
    isDarkMode.value = await themeService.loadIsDarkMode();
    Color? savedColor = await themeService.loadPrimaryColor();
    if (savedColor != null) {
      secondaryColors.value = savedColor;
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
    secondaryColors.value = color;
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
    secondaryColors.value = blackColor;
    lightSecondaryColour = offWhiteColor;
    darkSecondaryColour = const Color(0x4D0A1F44);
  }

  Color get currentSecondaryColour =>
      isDarkMode.value ? darkSecondaryColour : lightSecondaryColour;

  //----------------------------------------------------------------------------------------------------------//

  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: secondaryColors.value,
    scaffoldBackgroundColor: whiteColor,
    dialogTheme: DialogThemeData(
      backgroundColor: whiteColor,
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
      primary: secondaryColors.value,
      secondary: lightSecondaryColour,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: whiteColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(secondaryColors.value),
      ),
    ),
    hintColor: blackColor,
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(whiteColor),
      overlayColor: WidgetStateProperty.all(secondaryColors.value),
    ),
    cardTheme: CardThemeData(
      elevation: 4,
      color: whiteColor,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  //----------------------------------------------------------------------------------------------------------//

  ThemeData get darkTheme => ThemeData(
  
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: whiteColor,
    ),
    primaryColor: secondaryColors.value,
    scaffoldBackgroundColor: blackColor,
    dialogTheme: DialogThemeData(
      backgroundColor: blackColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      backgroundColor: blackColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      shadowColor: blackColor.withAlpha(80),
    ),
    colorScheme: ColorScheme.dark(
      primary: secondaryColors.value,
      secondary: darkSecondaryColour,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkSecondaryColour,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(secondaryColors.value),
      ),
    ),
    hintColor: greyColor,
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(blackColor),
    ),
    cardTheme: CardThemeData(
      color: blackColor,
      shadowColor: blackColor.withAlpha(80),
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  );
}
