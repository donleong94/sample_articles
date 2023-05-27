import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sample_article_flutter/model/most_viewed_result_item.dart';

import '../general_data.dart';

void main() {
  test(
    "make sure the props value is correct",
    () async {
      // assert
      expect(
        mostViewedResultTestData.props,
        [
          mostViewedResultTestData.url,
          mostViewedResultTestData.publishedDate,
          mostViewedResultTestData.title,
        ],
      );
    },
  );

  group("fromJson", () {
    test(
      "make sure the fromJson function returns a valid model object when reading valid JSON",
      () async {
        // arrange
        final Map<String, dynamic> tempData = json.decode(mostViewResultTestJson);

        // act
        final result = MostViewedResultItem.fromJson(tempData);

        // assert
        expect(result, mostViewedResultTestData);
      },
    );
  });

  group("toJson", () {
    test(
      "make sure the toJson function returns a JSON value in the form of a valid map object when converting model data to JSON",
      () async {
        // arrange
        final tempData = mostViewedResultTestData.toJson();

        // assert
        expect(tempData, mostViewResultTestMap);
      },
    );
  });
}
