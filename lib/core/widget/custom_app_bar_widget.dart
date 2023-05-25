import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/util/general_utils.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    required this.titleText,
    this.hasLeading = true,
    this.isCenterTitle = false,
    this.onBackPressed,
    this.actions,
  });

  final String titleText;
  final bool hasLeading;
  final bool isCenterTitle;
  final Function()? onBackPressed;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleText.isNotEmpty
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: FittedBox(
                fit: BoxFit.cover,
                child: titleText.mediumText(
                  fontSize: 20.sp,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            )
          : null,
      elevation: 0.0,
      centerTitle: isCenterTitle,
      titleSpacing: 0.0,
      automaticallyImplyLeading: hasLeading,
      leading: hasLeading
          ? IconButton(
              onPressed: () {
                AutoRouter.of(context).pop();

                if (onBackPressed != null) {
                  onBackPressed!();
                }
              },
              icon: Padding(
                padding: EdgeInsets.all(2.h),
                child: Image.asset(
                  "ic_arrow_left".toIconPng,
                  height: 20.h,
                  width: 20.h,
                  color: AppColor.mainColor,
                ),
              ),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(AppBar().preferredSize.height);
  }
}
