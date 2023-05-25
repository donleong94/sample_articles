import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/util/navigation_service.dart';

class GeneralUtils {
  static setupTimer({
    int durationMs = 250,
    required Function() callback,
  }) {
    Timer(
      Duration(milliseconds: durationMs),
      callback,
    );
  }

  static double statusBarHeight() {
    return MediaQuery.of(NavigationService.ctx!).viewPadding.top;
  }

  static String randomImage() {
    final rng = Random();
    final randomId = rng.nextInt(100);
    return "https://picsum.photos/id/$randomId/200";
  }
}

// Set hex string color
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    if (hexColor.isEmpty) {
      hexColor = "FFFFFF";
    }

    hexColor = hexColor.toUpperCase().replaceAll("#", "");

    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }

    return int.parse(hexColor, radix: 16);
  }
}

extension CustomText on String {
  Widget textGeneralConfig({
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    double? letterSpacing,
    TextOverflow? textOverflow,
  }) {
    return Text(
      toString(),
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? AppColor.commonGray,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        overflow: textOverflow,
      ),
    );
  }

  Widget boldText({
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
  }) {
    return textGeneralConfig(
      color: color ?? AppColor.commonBlack,
      fontSize: fontSize ?? 13.sp,
      textAlign: textAlign,
      maxLines: maxLines,
      textDecoration: textDecoration,
      fontWeight: FontWeight.w700,
      textOverflow: textOverflow,
    );
  }

  Widget mediumText({
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
  }) {
    return textGeneralConfig(
      color: color ?? AppColor.commonBlack,
      fontSize: fontSize ?? 13.sp,
      textAlign: textAlign,
      maxLines: maxLines,
      textDecoration: textDecoration,
      fontWeight: FontWeight.w500,
      textOverflow: textOverflow,
    );
  }

  Widget regularText({
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
  }) {
    return textGeneralConfig(
      color: color ?? AppColor.commonBlack,
      fontSize: fontSize ?? 13.sp,
      textAlign: textAlign,
      maxLines: maxLines,
      textDecoration: textDecoration,
      fontWeight: FontWeight.w300,
      textOverflow: textOverflow,
    );
  }
}

// Image file path handling
extension ImagePath on String {
  String get toImagePng => "assets/images/$this.png";

  String get toAnimation => "assets/animations/$this.gif";

  String get toIconPng => "assets/icons/$this.png";
}

// For empty spaces
extension EmptyPadding on num {
  // Empty sized box with custom height
  SizedBox get ph => SizedBox(height: toDouble());

  // Empty sized box for custom width
  SizedBox get pw => SizedBox(width: toDouble());

  // Sliver empty space
  SliverToBoxAdapter get sph {
    return SliverToBoxAdapter(
      child: SizedBox(height: toDouble()),
    );
  }
}

// For handling unusual JSON boolean value
bool fromDynamicToBool(dynamic value) {
  if (value is bool) {
    return value;
  } else if (value is int) {
    return value == 1 ? true : false;
  } else if (value is String) {
    return value == "true" || value == "1" ? true : false;
  } else {
    return false;
  }
}
