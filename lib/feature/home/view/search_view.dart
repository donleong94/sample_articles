import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:sample_article_flutter/core/constant/value_constants.dart';
import 'package:sample_article_flutter/core/util/general_utils.dart';
import 'package:sample_article_flutter/core/widget/general_button_widget.dart';
import 'package:sample_article_flutter/core/widget/search_bar_widget.dart';
import 'package:sample_article_flutter/start/app_router.dart';

class SearchView extends StatefulHookWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    final searchTextController = useTextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          60.ph,
          SearchBarWidget(
            keyword: "searchArticlesHere".i18n(),
            controller: searchTextController,
          ),
          24.ph,
          GeneralButtonWidget(
            labelText: "search".i18n(),
            onPressedFunc: () {
              final searchText = searchTextController.text;

              if (searchText.isNotEmpty) {
                AutoRouter.of(context).push(
                  ArticleListRoute(
                    listType: ValueConstants.searchListType,
                    searchStr: searchText,
                  ),
                );
              } else {
                GeneralUtils.showGeneralToast("searchTextEmptyMsg".i18n());
              }
            },
          ),
        ],
      ),
    );
  }
}
