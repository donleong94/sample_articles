import 'package:sample_article_flutter/core/util/type_short.dart';
import 'package:sample_article_flutter/env/env.dart';
import 'package:sample_article_flutter/network/misc/dio_client.dart';

abstract class ArticleDataSource {
  Future<Hmap?> getSearchResult({
    required String keyword,
    required int pageNo,
  });

  Future<Hmap?> getMostViewedList();
}

class ArticleService implements ArticleDataSource {
  ArticleService(this.client);

  final DioClient client;

  /// Search by keyword
  @override
  Future<Hmap?> getSearchResult({
    required String keyword,
    required int pageNo,
  }) async {
    final apiKey = Env.apiKey;
    final response = await client.get("svc/search/v2/articlesearch.json?fl=web_url%2Cheadline%2Cpub_date&page=$pageNo&q=$keyword&sort=newest&api-key=$apiKey");
    return response.jmapData;
  }

  /// Get the list of most view articles (in last 7 days)
  @override
  Future<Hmap?> getMostViewedList() async {
    final apiKey = Env.apiKey;
    final response = await client.get("svc/mostpopular/v2/viewed/7.json?api-key=$apiKey");
    return response.jmapData;
  }
}
