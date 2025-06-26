import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

enum Processing { done, waiting, error }

Widget screenPadding({EdgeInsets? customPadding, required Widget child}) {
  return Padding(
    padding: customPadding ?? EdgeInsets.symmetric(horizontal: 20.w),
    child: child,
  );
}
//----------------------------------------------------------//

SizedBox heightBox(int height) {
  return SizedBox(height: height.h);
}
//----------------------------------------------------------//

SizedBox widthBox(int width) {
  return SizedBox(width: width.h);
}

//----------------------------------------------------------//
Widget svgIconWidget({
  BoxFit? fit,
  Color? color,
  double width = 35,
  double height = 35,
  required String icon,
}) {
  return SvgPicture.asset(
    icon,
    width: width.h,
    height: height.h,
    fit: fit ?? BoxFit.cover,
    colorFilter: ColorFilter.mode(
      color ?? ThemeController().whiteColor,
      BlendMode.srcIn,
    ),
  );
}

Widget backButton() {
  return GestureDetector(
    onTap: () => Get.back(),
    child: Icon(size: 20.sp, CupertinoIcons.arrow_left),
  );
}

//----------------------------------------------------------//
Future<DateTime?> pickDateTime(
  BuildContext context, {
  bool pickTime = false,
  DateTime? initialDate,
}) async {
  DateTime? selectedDate = await showOmniDateTimePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(1600).subtract(const Duration(days: 3652)),
    lastDate: DateTime(2100),
    minutesInterval: 1,
    secondsInterval: 1,
    is24HourMode: false,
    isShowSeconds: false,
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 200),
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    constraints: const BoxConstraints(maxWidth: 350, maxHeight: 650),
    type: pickTime ? OmniDateTimePickerType.time : OmniDateTimePickerType.date,
    transitionBuilder: (context, anim1, anim2, child) {
      return FadeTransition(
        opacity: anim1.drive(Tween(begin: 0, end: 1)),
        child: child,
      );
    },
  );
  return selectedDate;
}

//----------------------------------------------------------//
Widget loader({
  Color? color,
  double? size,
  double? strokeWidth,
  required ThemeController themeController,
}) {
  return Container(
    alignment: Alignment.center,
    height: size ?? 40.w,
    width: size ?? 40.w,
    child: CircularProgressIndicator.adaptive(
      strokeWidth: strokeWidth ?? 5.w,
      valueColor: AlwaysStoppedAnimation<Color>(
        color ?? themeController.secondaryColors.value,
      ),
    ),
  );
}

//----------------------------------------------------------//
Future<void> showConfirmationDialogue({
  required ThemeController themeController,
  required String title,
  required dynamic description,
  required String buttonText,
  Color? buttonColor,
  bool oneOption = false,
  required void Function()? onPressedAction,
  Rx<Processing>? isProcessing,
}) async {
  await Get.dialog(
    Dialog(
      alignment: Alignment.center,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextConstant(
              title: title,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              fontSize: 16,
              softWrap: true,
            ),
            heightBox(16),
            if (description is String)
              TextConstant(
                title: description,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            if (description is Widget) description,
            heightBox(24),
            Obx(() {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child:
                    isProcessing != null &&
                        isProcessing.value == Processing.waiting
                    ? loader(themeController: themeController)
                    : Row(
                        spacing: 24.w,
                        children: [
                          if (!oneOption)
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ButtonStyle(
                                  fixedSize: WidgetStatePropertyAll(
                                    Size(Get.width, 46.h),
                                  ),
                                  side: WidgetStatePropertyAll(
                                    BorderSide(
                                      color:
                                          themeController.secondaryColors.value,
                                    ),
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                  ),
                                ),
                                child: TextConstant(
                                  title: 'Cancel',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                        ],
                      ),
              );
            }),
          ],
        ),
      ),
    ),
  );
}

Future showCustomDialog({required Widget child}) {
  return Get.dialog(Dialog(backgroundColor: Colors.transparent, child: child));
}

showCustomSnackBar({String? title, String? message}) {
  Get.snackbar(title!, message!);
}

AutoSizeText autoSizeText(
  String text, {
  Color? color,
  int? maxLine,
  double? maxFontSize,
  FontWeight? fontWeight,
}) {
  return AutoSizeText(
    text,
    minFontSize: 11,
    stepGranularity: 1,
    maxLines: maxLine ?? 1,
    maxFontSize: maxFontSize ?? 14,
    overflow: TextOverflow.ellipsis,
    presetFontSizes: const [16, 15, 14, 13, 12, 11],
    style: textStyle(fontWeight: fontWeight ?? FontWeight.bold, color: color),
  );
}

Future showCustomBottomSheet(
  ThemeController themeController, {
  required String title,
  required List<Widget> children,
  double? fontSize,
  bool isDismissibleBox = true,
}) async {
  await showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    enableDrag: isDismissibleBox,
    isDismissible: isDismissibleBox,
    showDragHandle: isDismissibleBox,
    backgroundColor: themeController.greyColor,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: screenPadding(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.h, left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextConstant(
                        title: title,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                      ),
                    ],
                  ),
                  ...children,
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

showImagePickerSheet({
  required VoidCallback onTapCamera,
  required VoidCallback onTapGallery,
  required ThemeController themeController,
}) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeController.blackColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextConstant(
            fontSize: 18.sp,
            title: 'Choose Image Source',
            fontWeight: FontWeight.bold,
          ),
          heightBox(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: elevatedButton(
                  title: 'Camera',
                  width: MediaQuery.sizeOf(Get.context!).width,
                  textColor: themeController.whiteColor,

                  onPressed: onTapCamera,
                ),
              ),
              widthBox(20),
              Expanded(
                child: elevatedButton(
                  title: 'Gallery',
                  width: MediaQuery.sizeOf(Get.context!).width,
                  textColor: themeController.whiteColor,
                  onPressed: onTapGallery,
                ),
              ),
            ],
          ),
          heightBox(20),
        ],
      ),
    ),
  );
}

class ButtonSquare extends StatelessWidget {
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? iconSize;
  final IconData? icon;

  const ButtonSquare({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    this.borderRadius,
    this.iconSize,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.w ?? 56.w,
        height: height?.h ?? 56.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 1.w,
          ),
        ),
        child: Center(
          child: Icon(icon, color: iconColor, size: iconSize?.sp ?? 30.sp),
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final double? size;
  final Color? borderColor;
  final double? borderWidth;

  ProfileAvatar({
    super.key,
    required this.imageUrl,
    this.size,
    this.borderColor,
    this.borderWidth,
  });

  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.h ?? 30.h,
      height: size?.w ?? 30.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: borderWidth?.w ?? 1.w,
          color: borderColor ?? themeController.blackColor,
        ),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: size?.h ?? 30.h,
          height: size?.w ?? 30.w,
        ),
      ),
    );
  }
}

class CustomBottomSheet {
  static void show({
    double? height,
    required Widget child,
    required String title,
    bool enableDrag = true,
    Color? backgroundColor,
    bool isDismissible = true,
    double? borderRadius = 20,
  }) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            minChildSize: height ?? 0.3,
            maxChildSize: height ?? 0.9,
            initialChildSize: height ?? 0.5,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.only(top: 12.h, left: 20.w, right: 20.w),
                decoration: BoxDecoration(
                  color:
                      backgroundColor ??
                      Theme.of(Get.context!).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(borderRadius ?? 20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextConstant(
                              title: title,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          CircleAvatar(
                            radius: 15.r,
                            backgroundColor: ThemeController().greyColor
                                .withAlpha(40),
                            child: InkWell(
                              onTap: () => Get.back(),
                              child: Icon(
                                size: 15.sp,
                                Icons.close,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: child,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

Widget elevatedButton({
  double? width,
  double? height,
  double? fontSize,
  Color? textColor,
  Gradient? gradient,
  required String title,
  Color? backGroundColor,
  Color? foregroundColor,
  bool? isBorder = false,
  bool? isGradient = true,
  List<Color>? colorsGradient,
  EdgeInsetsGeometry? padding,
  required void Function()? onPressed,
}) {
  Get.lazyPut(() => ThemeController());

  ThemeController themeController = Get.find<ThemeController>();

  return SizedBox(
    height: height ?? 50.h,
    width: width ?? Get.width,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: foregroundColor ?? themeController.blackColor,
        backgroundColor: backGroundColor ?? themeController.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      child: TextConstant(
        title: title,
        fontWeight: FontWeight.w600,
        fontSize: fontSize ?? 16.sp,
      ),
    ),
  );
}

AppBar commonAppbar({
  double? elevation,
  Color? titleColor,
  isCenterTitle = true,
  double? titleSpacing,
  required String title,
  Widget? leadingWidget,
  double? toolbarHeight,
  Color? backgroundColor,
  List<Widget>? actionWidget,
  PreferredSizeWidget? bottom,
  bool isLeadingEnable = true,
  required ThemeController themeController,
}) {
  return AppBar(
    bottom: bottom,
    elevation: elevation,
    centerTitle: isCenterTitle,
    titleSpacing: titleSpacing,
    scrolledUnderElevation: 0.0,
    toolbarHeight: toolbarHeight,
    automaticallyImplyLeading: false,
    backgroundColor: backgroundColor,
    surfaceTintColor: Colors.transparent,
    title: TextConstant(
      title: title,
      fontSize: 18,
      color: titleColor,
      fontWeight: FontWeight.bold,
    ),
    actions: actionWidget,
    leading: isLeadingEnable ? leadingWidget ?? backButton() : null,
  );
}
