import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/widget/custom_app_bar_widget.dart';
import 'package:sample_article_flutter/feature/home/view/search_view.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.zirconWhite,
      appBar: CustomAppBarWidget(
        titleText: "search".i18n(),
        hasLeading: true,
        isCenterTitle: true,
      ),
      body: const SearchView(),
    );
  }
}
