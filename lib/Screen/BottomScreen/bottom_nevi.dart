import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Screen/Home%20Screen/home_screen.dart';
import 'package:furniture_app/Screen/Layout%20Screen/layout_screen.dart';
import 'package:furniture_app/Screen/Notifications/notifications_screen.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'Controller/bottom_controller.dart';

class MainScreen extends StatelessWidget {
  final ThemeController themeController = ThemeController();
  final BottomNavController controller = Get.put(BottomNavController());
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controller.currentIndex == 2
          ? commonAppbar(
              title: 'Notification',
              themeController: themeController,
            )
          : commonAppbar(
              title: 'Arino',
              isCenterTitle: false,
              isLeadingEnable: false,
              themeController: themeController,
              actionWidget: [
                CircleAvatar(
                  backgroundColor: themeController.primaryColor.withValues(
                    alpha: 0.2,
                  ),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: themeController.primaryColor,
                  ),
                ),
                widthBox(8),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    scale: 3,
                    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                ),
                widthBox(8),
              ],
            ),
      body: Obx(
        () => IndexedStack(
          children: [
            HomeScreen(),
            LayoutScreen(),
            NotificationsScreen(),
            Container(),
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
