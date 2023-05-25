import 'package:sample_article_flutter/core/constant/value_constants.dart';
import 'package:sample_article_flutter/env/env.dart';
import 'package:sample_article_flutter/network/misc/dio_client.dart';
import 'package:sample_article_flutter/network/misc/dio_custom_response.dart';
import 'package:sample_article_flutter/start/service_locator.dart';

class ArticleService {
  final client = sl<DioClient>(instanceName: ValueConstants.articleClient);

  /// Search by keyword
  Future<DioCustomResponse> getSearchResult({
    required String keyword,
    required int pageNo,
  }) async {
    final apiKey = Env.apiKey;
    final response = await client.get("articlesearch.json?fl=web_url%2Cheadline%2Cpub_date&page=$pageNo&q=$keyword&sort=newest&api-key=$apiKey");
    return response;
  }

  /// Get the list of most view articles (in last 7 days)
  Future<DioCustomResponse> getMostViewedList() async {
    final apiKey = Env.apiKey;
    final response = await client.get("viewed/7.json?api-key=$apiKey");
    return response;
  }
}
