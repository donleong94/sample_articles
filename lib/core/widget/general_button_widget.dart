import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/util/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// When [isFilled] = false
/// [mainColor] will be used as border color
/// [subMainColor] will be used as background color
class GeneralButtonWidget extends StatelessWidget {
  const GeneralButtonWidget({
    super.key,
    required this.labelText,
    this.imgPath = "",
    this.isFilled = true,
    this.mainColor = AppColor.mainColor,
    this.subMainColor = AppColor.commonTransparent,
    this.textColor = AppColor.commonWhite,
    this.fontSize,
    this.isCenterText = true,
    this.onPressedFunc,
  });

  final String labelText;
  final String imgPath;
  final bool isFilled;
  final Color mainColor;
  final Color subMainColor;
  final Color textColor;
  final double? fontSize;
  final bool isCenterText;
  final VoidCallback? onPressedFunc;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedFunc,
      style: isFilled
          ? TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
              backgroundColor: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.h),
              ),
            )
          : TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
              backgroundColor: subMainColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: mainColor,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(10.h),
              ),
            ),
      child: Stack(
        children: [
          SizedBox(
            height: 20.h,
            child: Row(
              mainAxisAlignment: isCenterText ? MainAxisAlignment.center : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                labelText.textGeneralConfig(
                  fontSize: fontSize ?? 14.sp,
                  color: textColor,
                ),
              ],
            ),
          ),
          Visibility(
            visible: imgPath.isNotEmpty,
            child: Positioned(
              top: 0.h,
              bottom: 0.h,
              right: 0.h,
              child: Image.asset(
                imgPath,
                color: textColor,
                width: 20.h,
                height: 20.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
