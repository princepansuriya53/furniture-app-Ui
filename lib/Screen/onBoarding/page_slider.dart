import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Screen/onBoarding/Controller/slider_controller.dart';
import 'package:furniture_app/Screen/onBoarding/Widget/onboarding_page_widget.dart';

class PageSlider extends StatelessWidget {
  const PageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: controller.onPageChanged,
              itemCount: controller.onboardingItems.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: controller.pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (controller.pageController.position.haveDimensions) {
                      value = controller.pageController.page! - index;

                      value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                    }
                    return Transform.scale(
                      scale: value,
                      child: Opacity(
                        opacity: value,
                        child: OnboardingPage(
                          controller: controller,
                          item: controller.onboardingItems[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
