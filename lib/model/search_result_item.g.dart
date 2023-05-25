// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultItem _$SearchResultItemFromJson(Map<String, dynamic> json) =>
    SearchResultItem(
      webUrl: json['web_url'] as String?,
      headline: json['headline'] == null
          ? null
          : HeadlineData.fromJson(json['headline'] as Map<String, dynamic>),
      pubDate: json['pub_date'] as String?,
    );

Map<String, dynamic> _$SearchResultItemToJson(SearchResultItem instance) =>
    <String, dynamic>{
      'web_url': instance.webUrl,
      'headline': instance.headline,
      'pub_date': instance.pubDate,
    };
