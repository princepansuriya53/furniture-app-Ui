import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screen/Cart/Screens/address_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:furniture_app/Common/textfield_constant.dart';
import 'package:furniture_app/Screen/Cart/Controller/cart_controller.dart';

class CartDetails extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final ThemeController themeController = Get.find<ThemeController>();

  CartDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: 'Shipping details',
        themeController: themeController,
      ),
      body: screenPadding(
        child: SingleChildScrollView(
          child: Form(
            key: cartController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightBox(50),
                TextConstant(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  title: 'Add shipping details',
                ),
                heightBox(30),
                TextFieldConstant(
                  hintText: 'Full name',
                  prefixIcon: Icon(LucideIcons.user),
                  textInputAction: TextInputAction.next,
                  controller: cartController.fullNameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                heightBox(30),
                TextFieldConstant(
                  hintText: 'Location',
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icon(Icons.location_on_outlined),
                  controller: cartController.locationController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  },
                ),
                heightBox(30),
                TextFieldConstant(
                  hintText: 'Phone number',
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  prefixIcon: Icon(LucideIcons.phoneCall),
                  controller: cartController.phoneController,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  validator: (p0) {
                    if (p0 == null || p0.trim().isEmpty) {
                      return 'Please enter your phone number';
                    }
                    final phoneRegExp = RegExp(r'^[0-9]{10}$');
                    if (!phoneRegExp.hasMatch(p0.trim())) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
        child: elevatedButton(
          title: 'Proceed to checkout',
          onPressed: () {
            if (cartController.formKey.currentState!.validate()) {
              Get.to(() => AddressScreen());
            }
          },
        ),
      ),
    );
  }
}
