import 'package:flutter/material.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screen/Cart/Controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onRemove;
  final Function(int) onQuantityChanged;
  final ThemeController themeController = Get.find<ThemeController>();
  CartItemWidget({
    required this.item,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
      decoration: BoxDecoration(
        color: themeController.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(0, 2),
            color: themeController.blackColor.withValues(alpha: 0.05),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: themeController.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                fit: BoxFit.contain,
                getPlaceholderImage(item.name),
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: themeController.whiteColor,
                    child: Icon(
                      size: 25.sp,
                      Icons.image,
                      color: themeController.GreayColor,
                    ),
                  );
                },
              ),
            ),
          ),
          widthBox(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextConstant(
                      fontSize: 16,
                      title: item.name,
                      fontWeight: FontWeight.w500,
                    ),
                    InkWell(
                      onTap: onRemove,
                      child: Icon(LucideIcons.xCircle, size: 20.sp),
                    ),
                  ],
                ),
                heightBox(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextConstant(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      title: '\$${item.price.toStringAsFixed(2)}',
                    ),

                    TextConstant(
                      fontSize: 14,
                      textDecoration: TextDecoration.lineThrough,
                      title: '\$${item.originalPrice.toStringAsFixed(2)}',
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (item.quantity > 1) {
                              onQuantityChanged(item.quantity - 1);
                            }
                          },
                          child: Container(
                            height: 25.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: themeController.offWhiteColor,
                            ),
                            child: const Icon(Icons.remove, size: 16),
                          ),
                        ),
                        Container(
                          width: 30.w,
                          alignment: Alignment.center,
                          child: TextConstant(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            title:
                                '${item.quantity.toString().padLeft(2, '0')}',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onQuantityChanged(item.quantity + 1);
                          },
                          child: Container(
                            height: 25.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: themeController.offWhiteColor,
                            ),
                            child: Icon(Icons.add, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getPlaceholderImage(String itemName) {
    switch (itemName.toLowerCase()) {
      case 'comfy roaster':
        return 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=200&h=200&fit=crop';
      case 'croosa':
        return 'https://images.unsplash.com/photo-1506439773649-6e0eb8cfb237?w=200&h=200&fit=crop';
      case 'sitra brows':
        return 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=200&h=200&fit=crop';
      default:
        return 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=200&h=200&fit=crop';
    }
  }
}
