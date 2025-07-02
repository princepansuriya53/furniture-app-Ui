import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatelessWidget {
  final Map<String, dynamic> productData;
  ReviewScreen({super.key, required this.productData});
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        themeController: themeController,
        title: '${productData['Ratings']} (${productData['Reviews']}reviews)',
      ),
      body: screenPadding(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextConstant(
                fontSize: 15,
                title: 'See All',
                fontWeight: FontWeight.w500,
              ),
            ),
            heightBox(10),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (context, index) => heightBox(25),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10.w,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://img.freepik.com/free-photo/young-man-with-beard-round-glasses_273609-6203.jpg?semt=ais_hybrid&w=740",
                                ),
                              ),
                              TextConstant(
                                fontSize: 20,
                                title: 'jhone doe',
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          Row(
                            spacing: 8.w,
                            children: [
                              Icon(
                                Icons.star,
                                size: 15.sp,
                                color: themeController.primaryColor,
                              ),
                              TextConstant(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                title: productData['Ratings'],
                              ),
                            ],
                          ),
                        ],
                      ),
                      heightBox(10),
                      Row(
                        children: [
                          widthBox(50),
                          Expanded(
                            child: TextConstant(
                              fontSize: 10,
                              softWrap: true,
                              title:
                                  'I really the finish of the product and size is also perfect for my room',
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(CupertinoIcons.heart),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
