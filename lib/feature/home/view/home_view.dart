import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:sample_article_flutter/core/constant/value_constants.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/util/general_utils.dart';
import 'package:sample_article_flutter/start/app_router.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.ph,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          child: "search".i18n().boldText(
                fontSize: 14.sp,
              ),
        ),
        Divider(
          height: 1.h,
          color: AppColor.commonGray,
        ),
        _itemEntryView(
          title: "searchArticle".i18n(),
          onClicked: () {
            AutoRouter.of(context).push(
              const SearchRoute(),
            );
          },
        ),
        36.ph,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          child: "popular".i18n().boldText(
                fontSize: 14.sp,
              ),
        ),
        Divider(
          height: 1.h,
          color: AppColor.commonGray,
        ),
        _itemEntryView(
          title: "mostViewed".i18n(),
          onClicked: () {
            AutoRouter.of(context).push(
              ArticleListRoute(
                listType: ValueConstants.mostViewedListType,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _itemEntryView({
    required String title,
    required Function() onClicked,
  }) {
    return GestureDetector(
      onTap: onClicked,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
            child: Row(
              children: [
                title.mediumText(
                  fontSize: 14.sp,
                ),
                const Spacer(),
                SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: const Icon(
                    Icons.chevron_right,
                    color: AppColor.commonBlack,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.h,
            color: AppColor.commonGray,
          ),
        ],
      ),
    );
  }
}
