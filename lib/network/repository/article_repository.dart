import 'package:sample_article_flutter/model/most_viewed_result_item.dart';
import 'package:sample_article_flutter/model/search_result_item.dart';
import 'package:sample_article_flutter/network/service/article_service.dart';

class ArticleRepository {
  ArticleRepository(this.articleDataSource);

  final ArticleDataSource articleDataSource;

  Future getSearchResult({
    required String keyword,
    required int pageNo,
  }) async {
    try {
      final response = await articleDataSource.getSearchResult(keyword: keyword, pageNo: pageNo);
      final tempJsonList = response?["response"]["docs"] as List?;

      if (tempJsonList != null) {
        final List<SearchResultItem> dataList = tempJsonList.map((e) => SearchResultItem.fromJson(e)).toList();
        return dataList;
      } else {
        return <SearchResultItem>[];
      }
    } catch (e) {
      return <SearchResultItem>[];
    }
  }

  Future getMostViewedList() async {
    try {
      final response = await articleDataSource.getMostViewedList();
      final tempJsonList = response?["results"] as List?;

      if (tempJsonList != null) {
        final List<MostViewedResultItem> dataList = tempJsonList.map((e) => MostViewedResultItem.fromJson(e)).toList();
        return dataList;
      } else {
        return <SearchResultItem>[];
      }
    } catch (e) {
      return <SearchResultItem>[];
    }
  }
}
