import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({
    super.key,
    this.customHeight,
    this.customWidth,
    this.borderRadius = BorderRadius.zero,
    this.baseColor,
  });

  final double? customHeight;
  final double? customWidth;
  final BorderRadius? borderRadius;
  final Color? baseColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColor.commonGray300,
      highlightColor: AppColor.commonWhite,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(10.h)),
        child: SizedBox(
          height: customHeight ?? 100.h,
          width: customWidth ?? double.maxFinite,
        ),
      ),
    );
  }
}
