import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Screen/onBoarding/Controller/slider_controller.dart';
import 'package:furniture_app/Screen/onBoarding/page_slider.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();

    Get.put(OnboardingController());

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const PageSlider());
    });
  }
  ThemeController themeController = ThemeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.whiteColor,
      body: Center(child: SvgPicture.asset(AppAssets.appLogo)),
    );
  }
}
