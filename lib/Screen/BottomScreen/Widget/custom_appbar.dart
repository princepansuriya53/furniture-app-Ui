import 'package:flutter/material.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';

AppBar buildAppBar(int index, ThemeController themeController) {
  switch (index) {
    case 2:
      return commonAppbar(
        isLeadingEnable: false,
        title: 'Notification',
        themeController: themeController,
      );
    case 3:
      return commonAppbar(
        title: 'My Cart',
        isLeadingEnable: false,
        themeController: themeController,
      );
    default:
      return commonAppbar(
        title: 'Arino',
        isCenterTitle: false,
        isLeadingEnable: false,
        themeController: themeController,
        actionWidget: [
          CircleAvatar(
            backgroundColor: themeController.primaryColor.withAlpha(50),
            child: Icon(
              Icons.favorite_border_outlined,
              color: themeController.primaryColor,
            ),
          ),
          widthBox(8),
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              scale: 3,
            ),
          ),
          widthBox(8),
        ],
      );
  }
}
