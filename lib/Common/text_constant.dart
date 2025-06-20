import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextConstant extends StatelessWidget {
  const TextConstant({
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.fontWeight,
    required this.title,
    this.textDecoration,
    this.decorationColor,
    this.softWrap = false,
  });

  final Color? color;
  final String title;
  final bool softWrap;
  final int? maxLines;
  final double? height;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final Color? decorationColor;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color defaultColor = theme.colorScheme.onSurface;

    return Text(
      title,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textAlign: textAlign,

      style: textStyle(
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? defaultColor,
        textDecoration: textDecoration,

        decorationColor: decorationColor,
      ),
    );
  }
}

TextStyle textStyle({
  Color? color,
  double? height,
  double? fontSize,
  Color? decorationColor,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  TextDecoration? textDecoration,
}) {
  return GoogleFonts.poppins(
    color: color,
    height: height ?? 0,
    decoration: textDecoration,
    decorationColor: decorationColor,
    fontStyle: fontStyle ?? FontStyle.normal,
    fontWeight: fontWeight ?? FontWeight.normal,
    fontSize: fontSize != null ? fontSize.sp : 14.sp,
  );
}
