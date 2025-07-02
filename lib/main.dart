import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get.dart';

import 'shared_prefrence_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screen/BottomScreen/bottom_nevi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (_, child) {
        return GetMaterialApp(
          home: MainScreen(),
          title: 'Dating App',
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
