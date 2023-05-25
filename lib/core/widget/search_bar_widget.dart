import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    this.isEnabled = true,
    this.keyword = "",
    this.backgroundColor,
    this.viewHeight,
    this.controller,
    this.onFieldSubmitted,
  });

  final bool isEnabled;
  final String keyword;
  final Color? backgroundColor;
  final double? viewHeight;
  final TextEditingController? controller;
  final Function(String v)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(60.h),
      borderSide: const BorderSide(color: Colors.white),
    );

    return TextFormField(
      enabled: isEnabled,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      decoration: InputDecoration(
        hintText: keyword.isEmpty ? "search".i18n() : keyword,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: isEnabled ? Colors.grey : AppColor.commonGray,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.h),
        border: border,
        enabledBorder: border,
        disabledBorder: border,
        filled: true,
        fillColor: backgroundColor ?? AppColor.veryLightGray,
        suffix: SizedBox(width: 8.h),
        prefixIconConstraints: BoxConstraints(minHeight: 32.h, minWidth: 32.h),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          child: Icon(
            Icons.search,
            size: 28.h,
            color: AppColor.darkGray,
          ),
        ),
      ),
    );
  }
}
