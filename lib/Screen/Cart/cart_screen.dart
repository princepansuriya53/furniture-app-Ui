import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Screen/Cart/Controller/cart_controller.dart';
import 'package:furniture_app/Screen/Cart/Widget/cart_item_widget.dart';
import 'package:furniture_app/Screen/Cart/Screens/cart_details.dart';
import 'package:furniture_app/Theme/theme_controller.dart';

class CartScreen extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();
  final CartController cartController = Get.put(CartController());
  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenPadding(
        child: Column(
          children: [
            Flexible(
              child: Obx(
                () => ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartController.cartItems[index];
                    return CartItemWidget(
                      item: item,
                      onQuantityChanged: (quantity) {
                        cartController.updateQuantity(item.id, quantity);
                      },
                      onRemove: () {
                        cartController.removeItem(item.id);
                      },
                    );
                  },
                ),
              ),
            ),
            elevatedButton(
              title: 'Proceed to checkout',
              onPressed: () => Get.to(() => CartDetails()),
            ),
            heightBox(30),
          ],
        ),
      ),
    );
  }
}
