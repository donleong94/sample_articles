import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_article_flutter/core/constant/value_constants.dart';
import 'package:sample_article_flutter/feature/home/bloc_cubit/article_list_bloc.dart';
import 'package:sample_article_flutter/network/misc/general_status.dart';
import 'package:sample_article_flutter/network/repository/article_repository.dart';

import '../../../general_data.dart';
import '../../../network/repository/article_repository_test.mocks.dart';

void main() {
  late MockMockArticleDataSource mockArticleDataSource;
  late ArticleRepository articleRepository;
  late ArticleListBloc articleListBloc;

  setUp(() {
    mockArticleDataSource = MockMockArticleDataSource();
    articleRepository = ArticleRepository(mockArticleDataSource);
    articleListBloc = ArticleListBloc(articleRepository: articleRepository);
  });

  tearDown(() {
    articleListBloc.close();
  });

  group("Test for searched articles", () {
    const String keyword = "Test";
    const int pageNo = 0;

    blocTest<ArticleListBloc, ArticleListState>(
      "Make sure to return a search result list",
      build: () {
        when(
          mockArticleDataSource.getSearchResult(
            keyword: keyword,
            pageNo: pageNo,
          ),
        ).thenAnswer(
          (_) async {
            return <String, dynamic>{
              "response": {
                "docs": [
                  searchResultTestMap2,
                ],
              },
            };
          },
        );

        return articleListBloc;
      },
      act: (bloc) {
        articleListBloc.add(
          ArticleItemEvent(
            isResetting: true,
            listType: ValueConstants.searchListType,
            keyword: keyword,
          ),
        );
      },
      expect: () {
        const loadingResult = ArticleListState(
          status: GeneralStatus(ArticleListBloc.firstLoading),
          hasReachMax: false,
          currentPage: 0,
          resultList: [],
        );

        const listResult = ArticleListState(
          status: GeneralStatus.success,
          hasReachMax: true,
          currentPage: 0,
          resultList: [
            searchResultTestData,
          ],
        );

        return [
          loadingResult,
          listResult,
        ];
      },
      verify: (_) {
        mockArticleDataSource.getSearchResult(
          keyword: keyword,
          pageNo: pageNo,
        );
      },
    );

    blocTest<ArticleListBloc, ArticleListState>(
      "Make sure to return an empty search result list when something is not right in repository",
      build: () {
        when(
          mockArticleDataSource.getSearchResult(
            keyword: keyword,
            pageNo: pageNo,
          ),
        ).thenAnswer(
          (_) async {
            return <String, dynamic>{
              "response": {},
            };
          },
        );

        return articleListBloc;
      },
      act: (bloc) {
        articleListBloc.add(
          ArticleItemEvent(
            isResetting: true,
            listType: ValueConstants.searchListType,
            keyword: keyword,
          ),
        );
      },
      expect: () {
        const loadingResult = ArticleListState(
          status: GeneralStatus(ArticleListBloc.firstLoading),
          hasReachMax: false,
          currentPage: 0,
          resultList: [],
        );

        const listResult = ArticleListState(
          status: GeneralStatus.success,
          hasReachMax: true,
          currentPage: 0,
          resultList: [],
        );

        return [
          loadingResult,
          listResult,
        ];
      },
      verify: (_) {
        mockArticleDataSource.getSearchResult(
          keyword: keyword,
          pageNo: pageNo,
        );
      },
    );
  });

  group("Test for most viewed articles", () {
    blocTest<ArticleListBloc, ArticleListState>(
      "Make sure to return a most viewed list",
      build: () {
        when(
          mockArticleDataSource.getMostViewedList(),
        ).thenAnswer(
          (_) async {
            return <String, dynamic>{
              "results": [
                mostViewResultTestMap,
              ],
            };
          },
        );

        return articleListBloc;
      },
      act: (bloc) {
        articleListBloc.add(
          ArticleItemEvent(
            isResetting: true,
            listType: ValueConstants.mostViewedListType,
          ),
        );
      },
      expect: () {
        const loadingResult = ArticleListState(
          status: GeneralStatus(ArticleListBloc.firstLoading),
          hasReachMax: false,
          currentPage: 0,
          resultList: [],
        );

        const listResult = ArticleListState(
          status: GeneralStatus.success,
          hasReachMax: true,
          currentPage: 0,
          resultList: [
            mostViewedResultTestData,
          ],
        );

        return [
          loadingResult,
          listResult,
        ];
      },
      verify: (_) {
        mockArticleDataSource.getMostViewedList();
      },
    );

    blocTest<ArticleListBloc, ArticleListState>(
      "Make sure to return an empty list when something is not right in repository",
      build: () {
        when(
          mockArticleDataSource.getMostViewedList(),
        ).thenAnswer(
          (_) async {
            return <String, dynamic>{
              "response": {},
            };
          },
        );

        return articleListBloc;
      },
      act: (bloc) {
        articleListBloc.add(
          ArticleItemEvent(
            isResetting: true,
            listType: ValueConstants.mostViewedListType,
          ),
        );
      },
      expect: () {
        const loadingResult = ArticleListState(
          status: GeneralStatus(ArticleListBloc.firstLoading),
          hasReachMax: false,
          currentPage: 0,
          resultList: [],
        );

        const listResult = ArticleListState(
          status: GeneralStatus.success,
          hasReachMax: true,
          currentPage: 0,
          resultList: [],
        );

        return [
          loadingResult,
          listResult,
        ];
      },
      verify: (_) {
        mockArticleDataSource.getMostViewedList();
      },
    );
  });
}
