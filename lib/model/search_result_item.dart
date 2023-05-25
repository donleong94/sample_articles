import 'package:json_annotation/json_annotation.dart';
import 'package:sample_article_flutter/model/headline_data.dart';

part 'search_result_item.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class SearchResultItem {
  @JsonKey(name: 'web_url')
  final String? webUrl;

  @JsonKey(name: 'headline')
  final HeadlineData? headline;

  @JsonKey(name: 'pub_date')
  final String? pubDate;

  SearchResultItem({
    this.webUrl,
    this.headline,
    this.pubDate,
  });

  factory SearchResultItem.fromJson(Map<String, dynamic> json) => _$SearchResultItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultItemToJson(this);
}
