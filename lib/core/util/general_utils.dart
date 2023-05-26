import 'dart:async';
import 'dart:math';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/util/navigation_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sample_article_flutter/core/widget/custom_toast.dart';
import 'package:sample_article_flutter/start/service_locator.dart';
import 'package:stream_transform/stream_transform.dart' show RateLimit;

class GeneralUtils {
  // For bloc handling
  static EventTransformer<E> throttleDroppable<E>() {
    const throttleDuration = Duration(milliseconds: 200);

    return (events, mapper) {
      return droppable<E>().call(events.throttle(throttleDuration), mapper);
    };
  }

  static showGeneralToast(String message) {
    sl<CustomToast>().showGeneralToast(
      context: NavigationService.ctx!,
      msg: message,
    );
  }

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

// For date time
extension CustomDateFormat on DateFormat {
  DateTime? tryParse(String inputString) {
    try {
      return parse(inputString);
    } catch (e) {
      return null;
    }
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

Future<bool> checkLocationService() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    GeneralUtils.showGeneralToast("locationDisabledMsg".i18n());
    return false;
  } else {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        GeneralUtils.showGeneralToast("locationPermissionDeniedMsg".i18n());
        return false;
      } else if (permission == LocationPermission.deniedForever) {
        GeneralUtils.showGeneralToast("locationPermaBannedMsg".i18n());
        return false;
      } else {
        GeneralUtils.showGeneralToast("locationEnabledMsg".i18n());
        return true;
      }
    } else {
      GeneralUtils.showGeneralToast("locationEnabledMsg".i18n());
      return true;
    }
  }
}
