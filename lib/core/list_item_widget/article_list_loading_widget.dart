import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_article_flutter/core/util/general_utils.dart';
import 'package:sample_article_flutter/core/widget/custom_shimmer_widget.dart';

class ArticleListLoadingWidget extends StatelessWidget {
  const ArticleListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
      child: Column(
        children: [
          Column(
            children: [
              _smallHorizontalItem(),
              _smallHorizontalItem(),
              _smallHorizontalItem(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _smallHorizontalItem() {
    return Column(
      children: [
        16.ph,
        CustomShimmerWidget(
          customHeight: 24.h,
          customWidth: double.maxFinite,
        ),
        4.ph,
        CustomShimmerWidget(
          customHeight: 24.h,
          customWidth: double.maxFinite,
        ),
        16.ph,
      ],
    );
  }
}
