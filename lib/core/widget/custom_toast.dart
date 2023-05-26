import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_article_flutter/core/util/general_utils.dart';

/// Custom toast using [fluttertoast] package
/// Use to create a customize toast with icon & text & prevent multiple incoming call
class CustomToast {
  /// Instance of ftoast to create customize toast widget
  final FToast fToast = FToast();

  /// Set true if [fToast] is presented
  bool isActiveShowing = false;

  CustomToast.start();

  /// General show normal toast
  void showGeneralToast({
    required BuildContext context,
    String msg = "",
  }) async {
    if (isActiveShowing) {
      return;
    }

    await Future.delayed(
      Duration.zero,
      () {
        if (msg.isNotEmpty) {
          Fluttertoast.showToast(msg: msg);
        }
      },
    );
  }

  void showCustomToastVertical({
    required BuildContext context,
    String imgSrc = "",
    String msg = "",
  }) async {
    if (isActiveShowing) {
      return;
    }

    isActiveShowing = true;
    fToast.init(context);

    await Future.delayed(
      Duration.zero,
      () {
        fToast.showToast(
          toastDuration: const Duration(milliseconds: 600),
          child: Material(
            color: AppColor.commonBlackA87,
            borderRadius: BorderRadius.circular(10.h),
            child: Padding(
              padding: EdgeInsets.all(15.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: imgSrc.isNotEmpty,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 4.h),
                      child: Image.asset(
                        imgSrc,
                        color: AppColor.commonWhite,
                        height: 35.h,
                        width: 35.h,
                      ),
                    ),
                  ),
                  msg.mediumText(
                    color: AppColor.commonWhite,
                  ),
                ],
              ),
            ),
          ),
          gravity: ToastGravity.CENTER,
        );
      },
    ).then((_) {
      isActiveShowing = false;
    });
  }
}
