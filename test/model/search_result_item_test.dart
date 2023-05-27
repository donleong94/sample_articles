import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sample_article_flutter/model/search_result_item.dart';

import '../general_data.dart';

void main() {
  test(
    "make sure the props value is correct",
    () async {
      // assert
      expect(
        searchResultTestData.props,
        [
          searchResultTestData.webUrl,
          searchResultTestData.headline,
          searchResultTestData.pubDate,
        ],
      );
    },
  );

  group("fromJson", () {
    test(
      "make sure the fromJson function returns a valid model object when reading valid JSON",
      () async {
        // arrange
        final Map<String, dynamic> tempData = json.decode(searchResultTestJson);

        // act
        final result = SearchResultItem.fromJson(tempData);

        // assert
        expect(result, searchResultTestData);
      },
    );
  });

  group("toJson", () {
    test(
      "make sure the toJson function returns a JSON value in the form of a valid map object when converting model data to JSON",
      () async {
        // arrange
        final tempData = searchResultTestData.toJson();

        // assert
        expect(tempData, searchResultTestMap1);
      },
    );
  });
}
