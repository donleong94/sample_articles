import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'most_viewed_result_item.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class MostViewedResultItem extends Equatable {
  @JsonKey(name: 'url')
  final String? url;

  @JsonKey(name: 'published_date')
  final String? publishedDate;

  @JsonKey(name: 'title')
  final String? title;

  const MostViewedResultItem({
    this.url,
    this.publishedDate,
    this.title,
  });

  @override
  List<Object?> get props {
    return [
      url,
      publishedDate,
      title,
    ];
  }

  factory MostViewedResultItem.fromJson(Map<String, dynamic> json) => _$MostViewedResultItemFromJson(json);

  Map<String, dynamic> toJson() => _$MostViewedResultItemToJson(this);
}
