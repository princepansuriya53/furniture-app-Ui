import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:furniture_app/Screen/Auth/Sign%20In/logn_screen.dart';

import 'shared_prefrence_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Dating App',
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
