import 'package:sample_article_flutter/core/util/type_short.dart';

class DioCustomResponse {
  DioCustomResponse({
    required this.response,
    this.url,
  });

  final dynamic response;
  final String? url;

  Hmap? get jmapData {
    return response.data as Hmap?;
  }
}
