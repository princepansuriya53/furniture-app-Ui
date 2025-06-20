import 'package:furniture_app/Screen/Auth/logn_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Constants/app_assets.dart';

class OnboardingController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final PageController pageController = PageController();

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      imagePath: AppAssets.image1,
      title: "New designs\neveryday",
      description:
          "Shopee adds new designs every day. Explore and find the best furniture for your home and offices.",
    ),
    OnboardingItem(
      imagePath: AppAssets.image2,
      title: "Minimal Look\nBetter quality",
      description:
          "Shopee adds new designs every day. Explore and find the best furniture for your home and offices.",
    ),
    OnboardingItem(
      imagePath: AppAssets.image3,
      title: "Fastest home\ndelivery",
      description:
          "Shopee adds new designs every day. Explore and find the best furniture for your home and offices.",
    ),
  ];

  void nextPage() {
    if (currentIndex.value < onboardingItems.length - 1) {
      pageController.nextPage(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class OnboardingItem {
  final String title;
  final String imagePath;
  final String description;

  OnboardingItem({
    required this.title,
    required this.imagePath,
    required this.description,
  });
}
