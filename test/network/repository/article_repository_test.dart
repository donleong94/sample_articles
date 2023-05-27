import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_article_flutter/network/repository/article_repository.dart';
import 'package:sample_article_flutter/network/service/article_service.dart';

import '../../general_data.dart';
import '../../network/repository/article_repository_test.mocks.dart';

class MockArticleDataSource extends Mock implements ArticleDataSource {}

@GenerateMocks([MockArticleDataSource])
void main() {
  late MockMockArticleDataSource mockArticleDataSource;
  late ArticleRepository articleRepository;

  setUp(() {
    mockArticleDataSource = MockMockArticleDataSource();
    articleRepository = ArticleRepository(mockArticleDataSource);
  });

  group("getSearchResult", () {
    const String keyword = "Test";
    const int pageNo = 0;

    test(
      "make sure to return the sample list",
      () async {
        // arrange
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

        // act
        final result = await articleRepository.getSearchResult(
          keyword: keyword,
          pageNo: pageNo,
        );

        // assert
        verify(
          mockArticleDataSource.getSearchResult(
            keyword: keyword,
            pageNo: pageNo,
          ),
        );

        expect(
          result,
          [
            searchResultTestData,
          ],
        );
      },
    );

    test(
      "make sure to return the empty list when anything goes wrong",
      () async {
        // arrange
        when(
          mockArticleDataSource.getSearchResult(
            keyword: keyword,
            pageNo: pageNo,
          ),
        ).thenAnswer(
          (_) async {
            return <String, dynamic>{};
          },
        );

        // act
        final result = await articleRepository.getSearchResult(
          keyword: keyword,
          pageNo: pageNo,
        );

        // assert
        verify(
          mockArticleDataSource.getSearchResult(
            keyword: keyword,
            pageNo: pageNo,
          ),
        );

        expect(
          result,
          [],
        );
      },
    );
  });

  group("getMostViewedList", () {
    test(
      "make sure to return the sample list",
      () async {
        // arrange
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

        // act
        final result = await articleRepository.getMostViewedList();

        // assert
        verify(
          mockArticleDataSource.getMostViewedList(),
        );

        expect(
          result,
          [
            mostViewedResultTestData,
          ],
        );
      },
    );

    test(
      "make sure to return the empty list when anything goes wrong",
      () async {
        // arrange
        when(
          mockArticleDataSource.getMostViewedList(),
        ).thenAnswer(
          (_) async {
            return <String, dynamic>{};
          },
        );

        // act
        final result = await articleRepository.getMostViewedList();

        // assert
        verify(
          mockArticleDataSource.getMostViewedList(),
        );

        expect(
          result,
          [],
        );
      },
    );
  });
}
