import 'package:flutter/material.dart';
import 'package:furniture_app/Screen/onBoarding/Controller/slider_controller.dart';
import 'package:furniture_app/Screen/onBoarding/Widget/onboarding_page_widget.dart';
import 'package:get/get.dart';

class PageSlider extends StatelessWidget {
  const PageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: controller.onboardingItems.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  controller: controller,
                  item: controller.onboardingItems[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
