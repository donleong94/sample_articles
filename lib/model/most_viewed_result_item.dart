import 'package:json_annotation/json_annotation.dart';

part 'most_viewed_result_item.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class MostViewedResultItem {
  @JsonKey(name: 'url')
  final String? url;

  @JsonKey(name: 'published_date')
  final String? publishedDate;

  @JsonKey(name: 'title')
  final String? title;

  MostViewedResultItem({
    this.url,
    this.publishedDate,
    this.title,
  });

  factory MostViewedResultItem.fromJson(Map<String, dynamic> json) => _$MostViewedResultItemFromJson(json);

  Map<String, dynamic> toJson() => _$MostViewedResultItemToJson(this);
}
