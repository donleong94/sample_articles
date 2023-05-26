import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/util/general_utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    checkLocationService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.ph,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 4.h),
          child: "search".i18n().mediumText(
                fontSize: 14.sp,
              ),
        ),
        Divider(
          height: 1.h,
          color: AppColor.commonGray,
        ),
        _itemEntryView(
          title: "searchArticle".i18n(),
          onClicked: () {},
        ),
        36.ph,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 4.h),
          child: "popular".i18n().mediumText(
                fontSize: 14.sp,
              ),
        ),
        Divider(
          height: 1.h,
          color: AppColor.commonGray,
        ),
        _itemEntryView(
          title: "mostViewed".i18n(),
          onClicked: () {},
        ),
      ],
    );
  }

  Widget _itemEntryView({
    required String title,
    required Function() onClicked,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          child: title.mediumText(
            fontSize: 14.sp,
          ),
        ),
        Divider(
          height: 1.h,
          color: AppColor.commonGray,
        ),
      ],
    );
  }
}
