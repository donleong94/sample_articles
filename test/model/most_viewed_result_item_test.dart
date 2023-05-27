import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sample_article_flutter/model/most_viewed_result_item.dart';

void main() {
  const sampleTestJson = """{
    "url": "https://www.test.com/",
    "published_date": "2023-05-31",
    "title": "Test Title"
  }""";

  const sampleTestData = MostViewedResultItem(
    url: "https://www.test.com/",
    publishedDate: "2023-05-31",
    title: "Test Title",
  );

  const sampleTestMap = {
    "url": "https://www.test.com/",
    "published_date": "2023-05-31",
    "title": "Test Title",
  };

  test(
    "make sure the props value is correct",
    () async {
      // assert
      expect(
        sampleTestData.props,
        [
          sampleTestData.url,
          sampleTestData.publishedDate,
          sampleTestData.title,
        ],
      );
    },
  );

  group("fromJson", () {
    test(
      "make sure the fromJson function returns a valid model object when reading valid JSON",
      () async {
        // arrange
        final Map<String, dynamic> tempData = json.decode(sampleTestJson);

        // act
        final result = MostViewedResultItem.fromJson(tempData);

        // assert
        expect(result, sampleTestData);
      },
    );
  });

  group("toJson", () {
    test(
      "make sure the toJson function returns a JSON value in the form of a valid map object when converting model data to JSON",
      () async {
        // arrange
        final tempData = sampleTestData.toJson();

        // assert
        expect(tempData, sampleTestMap);
      },
    );
  });
}
