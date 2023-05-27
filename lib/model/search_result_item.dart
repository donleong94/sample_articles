import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sample_article_flutter/core/util/general_utils.dart';
import 'package:sample_article_flutter/model/headline_data.dart';

part 'search_result_item.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class SearchResultItem extends Equatable {
  @JsonKey(name: 'web_url')
  final String? webUrl;

  @JsonKey(name: 'headline')
  final HeadlineData? headline;

  @JsonKey(name: 'pub_date')
  final String? pubDate;

  const SearchResultItem({
    this.webUrl,
    this.headline,
    this.pubDate,
  });

  @override
  List<Object?> get props {
    return [
      webUrl,
      headline,
      pubDate,
    ];
  }

  factory SearchResultItem.fromJson(Map<String, dynamic> json) => _$SearchResultItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultItemToJson(this);

  String formattedPubDate() {
    // Example format: 2023-05-24T09:00:13+0000
    final oriDate = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").tryParse(pubDate ?? "");

    if (oriDate != null) {
      return DateFormat("yyyy-MM-dd").format(oriDate);
    } else {
      return pubDate ?? "";
    }
  }
}
