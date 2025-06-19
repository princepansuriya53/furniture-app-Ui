import 'package:flutter/material.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final PageController pageController = PageController();

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: "New designs\neveryday",
      description:
          "Shopee adds new designs every day. Explore and find\nthe best furniture for your home and offices.",
      imagePath: AppAssets.image1,
    ),
    OnboardingItem(
      title: "Minimal Look\nBetter quality",
      description:
          "Shopee adds new designs every day. Explore and find\nthe best furniture for your home and offices.",
      imagePath: AppAssets.image2,
    ),
    OnboardingItem(
      title: "Fastest home\ndelivery",
      description:
          "Shopee adds new designs every day. Explore and find\nthe best furniture for your home and offices.",
      imagePath: AppAssets.image3,
    ),
  ];

  void nextPage() {
    if (currentIndex.value < onboardingItems.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to main app or login screen
      Get.toNamed('/home'); // Replace with your route
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
  final String description;
  final String imagePath;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
