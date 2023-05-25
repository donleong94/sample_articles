import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get getTheme {
    return _themeData();
  }

  static ThemeData _themeData() {
    return ThemeData(
      fontFamily: "Gotham",
      colorScheme: ThemeData().colorScheme.copyWith(primary: AppColor.mainColor),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 20.sp),
        titleSmall: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 15.sp),
        bodyMedium: TextStyle(fontSize: 12.sp),
      ),
      scaffoldBackgroundColor: AppColor.zirconWhite,
      appBarTheme: const AppBarTheme(backgroundColor: AppColor.zirconWhite),
      textSelectionTheme: const TextSelectionThemeData(),
    );
  }
}
