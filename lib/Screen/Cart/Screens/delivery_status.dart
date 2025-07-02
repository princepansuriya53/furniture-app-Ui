import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Screen/BottomScreen/bottom_nevi.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DeliveryStatus extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();
  DeliveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(title: '', themeController: themeController),
      body: screenPadding(
        child: Column(
          children: [
            TextConstant(
              title: 'Delivery status',
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            heightBox(16),
            TextConstant(
              fontSize: 16,
              title: 'Estimate delivery',
              color: themeController.greyColor,
            ),
            heightBox(8),
            TextConstant(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              title: '20 june 2022: 05:30 PM',
            ),
            heightBox(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConstant(
                  fontSize: 18,
                  title: 'Track order',
                  fontWeight: FontWeight.w600,
                ),
                TextConstant(title: 'NYC1054C', fontSize: 16),
              ],
            ),
            Divider(),
            heightBox(30),
            Flexible(
              child: Column(
                children: [
                  TimelineItem(
                    time: '9:10 AM, 10 june 2022',
                    title: 'Pick-up request accepted',
                    showLine: true,
                    isCompleted: true,
                    icon: Icons.check,
                    iconColor: Colors.green,
                  ),
                  TimelineItem(
                    showLine: true,
                    isCompleted: true,
                    time: '12:40 PM, 19 june 2022',
                    icon: Icons.radio_button_checked,
                    title: 'Product picked & started journey',
                    iconColor: themeController.primaryColor,
                  ),
                  TimelineItem(
                    showLine: true,
                    isCompleted: true,
                    iconColor: Colors.orange,
                    icon: LucideIcons.warehouse,
                    titleColor: Colors.orange,
                    time: '1:10 AM, 20 june 2022',
                    title: 'Dispatch in local warehouse',
                  ),
                  TimelineItem(
                    showLine: false,
                    isCompleted: false,
                    title: 'Parcel delivered!',
                    time: '05:30 AM, 20 june 2022',
                    icon: Icons.delivery_dining_sharp,
                    iconColor: themeController.greyColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: TextButton(
                onPressed: () => Get.to(() => MainScreen()),
                child: TextConstant(
                  fontSize: 20,
                  title: 'Home Page',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String time;
  final bool isCompleted;
  final bool showLine;
  final Color? titleColor;

  const TimelineItem({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.time,
    required this.isCompleted,
    required this.showLine,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline icon and line
        Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: iconColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
            if (showLine)
              Container(
                width: 2,
                height: 40,
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(color: Colors.grey[300]),
              ),
          ],
        ),
        SizedBox(width: 16),

        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: titleColor ?? Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                  SizedBox(width: 4),
                  Text(
                    time,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
              if (showLine) SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }
}
