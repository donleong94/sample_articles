import 'package:sample_article_flutter/core/constant/value_constants.dart';
import 'package:sample_article_flutter/env/env.dart';
import 'package:sample_article_flutter/network/misc/dio_client.dart';
import 'package:sample_article_flutter/network/misc/dio_custom_response.dart';

class ArticleService {
  ArticleService(this.client);

  final DioClient client;

  /// Search by keyword
  Future<DioCustomResponse> getSearchResult({
    required String keyword,
    required int pageNo,
  }) async {
    final apiKey = Env.apiKey;
    final response = await client.get("svc/search/v2/articlesearch.json?fl=web_url%2Cheadline%2Cpub_date&page=$pageNo&q=$keyword&sort=newest&api-key=$apiKey");
    return response;
  }

  /// Get the list of most view articles (in last 7 days)
  Future<DioCustomResponse> getMostViewedList() async {
    final apiKey = Env.apiKey;
    final response = await client.get("svc/mostpopular/v2/viewed/7.json?api-key=$apiKey");
    return response;
  }
}
