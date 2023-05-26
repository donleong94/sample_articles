import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/widget/custom_app_bar_widget.dart';
import 'package:sample_article_flutter/feature/home/view/home_view.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.zirconWhite,
      appBar: CustomAppBarWidget(
        titleText: "nyt".i18n(),
        hasLeading: false,
        isCenterTitle: true,
      ),
      body: const HomeView(),
    );
  }
}
