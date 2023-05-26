import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomLoaderWidget extends StatelessWidget {
  const BottomLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 24.h,
        width: 24.h,
        child: const CircularProgressIndicator(
          strokeWidth: 6,
          color: AppColor.mainColor,
          backgroundColor: AppColor.zirconWhite,
        ),
      ),
    );
  }
}
