import 'package:sample_article_flutter/model/search_result_item.dart';
import 'package:sample_article_flutter/network/service/article_service.dart';

class ArticleRepository {
  ArticleRepository(this.articleService);

  final ArticleService articleService;

  Future getSearchResult({
    required String keyword,
    required int pageNo,
  }) async {
    try {
      final response = await articleService.getSearchResult(keyword: keyword, pageNo: pageNo);
      final data = response.jmapData;
      final tempJsonList = data?["response"]["docs"] as List?;

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
      final response = await articleService.getMostViewedList();
      final data = response.jmapData;
      final tempJsonList = data?["results"] as List?;

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
}
