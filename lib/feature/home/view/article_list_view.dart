import 'package:flutter/material.dart';

class ArticleListView extends StatefulWidget {
  const ArticleListView({
    super.key,
    required this.listType,
    required this.searchStr,
  });

  final int listType;
  final String searchStr;

  @override
  State<ArticleListView> createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State<ArticleListView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
