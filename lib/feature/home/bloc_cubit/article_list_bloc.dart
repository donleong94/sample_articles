import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_article_flutter/core/constant/value_constants.dart';
import 'package:sample_article_flutter/core/util/general_utils.dart';
import 'package:sample_article_flutter/network/misc/general_status.dart';
import 'package:sample_article_flutter/network/repository/article_repository.dart';

part 'article_list_event.dart';

part 'article_list_state.dart';

class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  ArticleListBloc({
    required this.articleRepository,
  }) : super(const ArticleListState()) {
    on<ArticleItemEvent>(
      onArticleItemEvent,
      transformer: GeneralUtils.throttleDroppable(),
    );
  }

  static const int firstLoading = 10;

  final ArticleRepository articleRepository;

  onArticleItemEvent(
    ArticleItemEvent event,
    Emitter<ArticleListState> emitter,
  ) async {
    bool isResetting = event.isResetting;

    if (state.hasReachMax && !isResetting) {
      return;
    }

    try {
      int currentPage = 0;
      bool hasPagination = false;
      List<dynamic> response = [];

      if (state.status.isInit() || isResetting) {
        emitter(state.copyWith(status: const GeneralStatus(firstLoading)));
        currentPage = 0;
      } else {
        currentPage = state.currentPage + 1;
      }

      if (event.listType == ValueConstants.searchListType) {
        hasPagination = true;

        response = await articleRepository.getSearchResult(
          keyword: event.keyword,
          pageNo: currentPage,
        );
      } else if (event.listType == ValueConstants.mostViewedListType) {
        hasPagination = false;
        response = await articleRepository.getMostViewedList();
      } else {
        hasPagination = false;
        response = [];
      }

      List<dynamic> finalDataList = [];

      if (currentPage == 1) {
        finalDataList = response;
      } else {
        finalDataList = List.of(state.resultList)..addAll(response);
      }

      emitter(
        state.copyWith(
          status: GeneralStatus.success,
          hasReachMax: hasPagination ? response.length < 10 : true,
          currentPage: currentPage,
          resultList: finalDataList,
        ),
      );
    } catch (e) {
      emitter(
        state.copyWith(
          status: GeneralStatus.success,
          hasReachMax: true,
          currentPage: state.currentPage,
          resultList: state.resultList,
        ),
      );
    }
  }
}
