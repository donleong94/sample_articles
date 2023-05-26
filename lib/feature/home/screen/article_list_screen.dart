import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/widget/custom_app_bar_widget.dart';
import 'package:sample_article_flutter/feature/home/view/article_list_view.dart';

@RoutePage()
class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({
    super.key,
    required this.listType,
    this.searchStr = "",
  });

  final int listType;
  final String searchStr;

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.zirconWhite,
      appBar: CustomAppBarWidget(
        titleText: "articles".i18n(),
        hasLeading: true,
        isCenterTitle: true,
      ),
      body: ArticleListView(
        listType: widget.listType,
        searchStr: widget.searchStr,
      ),
    );
  }
}
