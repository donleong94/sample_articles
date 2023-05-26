import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/util/general_utils.dart';
import 'package:sample_article_flutter/model/most_viewed_result_item.dart';
import 'package:sample_article_flutter/model/search_result_item.dart';

class ArticleListItemWidget extends StatelessWidget {
  const ArticleListItemWidget({
    super.key,
    this.itemData,
  });

  final dynamic itemData;

  @override
  Widget build(BuildContext context) {
    String title = "";
    String desc = "";

    if (itemData is SearchResultItem) {
      final tempData = itemData as SearchResultItem;
      title = tempData.headline?.main ?? "";
      desc = tempData.formattedPubDate();
    } else if (itemData is MostViewedResultItem) {
      final tempData = itemData as MostViewedResultItem;
      title = tempData.title ?? "";
      desc = tempData.publishedDate ?? "";
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        title.boldText(
          fontSize: 16.sp,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        ),
        4.ph,
        desc.mediumText(
          fontSize: 14.sp,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        Divider(
          height: 1.h,
          color: AppColor.commonGray,
        ),
      ],
    );
  }
}
