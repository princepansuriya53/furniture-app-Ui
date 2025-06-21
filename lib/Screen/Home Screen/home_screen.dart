import 'package:flutter/material.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = ThemeController();
    return Scaffold(
      appBar: commonAppbar(title: 'Arino', themeController: themeController),
    );
  }
}
