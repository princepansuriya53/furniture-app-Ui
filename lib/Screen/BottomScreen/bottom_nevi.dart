import 'package:flutter/material.dart';
import 'package:furniture_app/Screen/BottomScreen/Widget/custom_appbar.dart';
import 'package:furniture_app/Screen/Cart/cart_screen.dart';
import 'package:furniture_app/Screen/Home%20Screen/home_screen.dart';
import 'package:furniture_app/Screen/Layout%20Screen/layout_screen.dart';
import 'package:furniture_app/Screen/Notifications/notifications_screen.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'Controller/bottom_controller.dart';

class MainScreen extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();
  final BottomNavController controller = Get.put(BottomNavController());
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Obx(() {
          return buildAppBar(controller.currentIndex.value, themeController);
        }),
      ),

      body: Obx(
        () => IndexedStack(
          children: [
            HomeScreen(),
            LayoutScreen(),
            NotificationsScreen(),
            CartScreen(),
          ],
          index: controller.currentIndex.value,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 0,
          iconSize: 24,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          onTap: controller.changeTabIndex,
          type: BottomNavigationBarType.shifting,
          currentIndex: controller.currentIndex.value,
          backgroundColor: themeController.whiteColor,
          unselectedItemColor: themeController.greyColor,
          selectedItemColor: themeController.primaryColor,
          items: const [
            BottomNavigationBarItem(
              label: 'Home Page',
              icon: Icon(LucideIcons.home),
            ),
            BottomNavigationBarItem(
              label: 'Room Layout',
              icon: Icon(LucideIcons.layoutPanelLeft),
            ),
            BottomNavigationBarItem(
              label: 'Notification',
              icon: Icon(LucideIcons.bell),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(LucideIcons.shoppingCart),
            ),
          ],
        ),
      ),
    );
  }
}
