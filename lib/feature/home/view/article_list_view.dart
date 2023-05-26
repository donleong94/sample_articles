import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:sample_article_flutter/core/list_item_widget/article_list_item_widget.dart';
import 'package:sample_article_flutter/core/list_item_widget/article_list_loading_widget.dart';
import 'package:sample_article_flutter/core/widget/bottom_loader_widget.dart';
import 'package:sample_article_flutter/core/widget/empty_section_widget.dart';
import 'package:sample_article_flutter/feature/home/bloc_cubit/article_list_bloc.dart';
import 'package:sample_article_flutter/network/repository/article_repository.dart';
import 'package:sample_article_flutter/start/service_locator.dart';

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

class _ArticleListViewState extends State<ArticleListView> with AutomaticKeepAliveClientMixin {
  final ArticleListBloc articleListBloc = ArticleListBloc(
    articleRepository: sl<ArticleRepository>(),
  );

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _refreshList();

    scrollController.addListener(() {
      _onScroll();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RefreshIndicator(
      onRefresh: () async {
        _refreshList();
      },
      child: BlocConsumer<ArticleListBloc, ArticleListState>(
        bloc: articleListBloc,
        listener: (context, state) {},
        builder: (context, state) {
          Widget contentWidget = Container();

          if (state.status.isInit() || state.status.statusVal == ArticleListBloc.firstLoading) {
            contentWidget = const ArticleListLoadingWidget();
          } else if (state.resultList.isEmpty) {
            contentWidget = SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  EmptySectionWidget(
                    title: "noItem".i18n(),
                    verticalPadding: ScreenUtil().screenHeight * 0.25,
                  ),
                ],
              ),
            );
          } else {
            contentWidget = CustomScrollView(
              controller: scrollController,
              primary: false,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.h),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index >= state.resultList.length) {
                          return const SizedBox.shrink();
                        } else {
                          return ArticleListItemWidget(
                            itemData: state.resultList[index],
                          );
                        }
                      },
                      childCount: state.resultList.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 16.h,
                      crossAxisCount: 1,
                      childAspectRatio: 6 / 1.6,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: state.hasReachMax
                      ? const SizedBox.shrink()
                      : SizedBox(
                          height: 100.h,
                          width: double.maxFinite,
                          child: const BottomLoaderWidget(),
                        ),
                ),
              ],
            );
          }

          return contentWidget;
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom()) {
      articleListBloc.add(
        ArticleItemEvent(
          isResetting: false,
          listType: widget.listType,
          keyword: widget.searchStr,
        ),
      );
    }
  }

  bool _isBottom() {
    if (!scrollController.hasClients) {
      return false;
    }

    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _refreshList() {
    articleListBloc.add(
      ArticleItemEvent(
        isResetting: true,
        listType: widget.listType,
        keyword: widget.searchStr,
      ),
    );
  }
}
