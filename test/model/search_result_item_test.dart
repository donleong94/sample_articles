import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sample_article_flutter/model/headline_data.dart';
import 'package:sample_article_flutter/model/search_result_item.dart';

void main() {
  const headlineTestData = HeadlineData(
    main: "Test Title",
  );

  const sampleTestJson = """{
    "web_url": "https://www.test.com/",
    "headline": {
      "main": "Test Title"
    },
    "pub_date": "2023-05-31"
  }""";

  const sampleTestData = SearchResultItem(
    webUrl: "https://www.test.com/",
    headline: headlineTestData,
    pubDate: "2023-05-31",
  );

  const sampleTestMap = {
    "web_url": "https://www.test.com/",
    "headline": headlineTestData,
    "pub_date": "2023-05-31",
  };

  test(
    "make sure the props value is correct",
    () async {
      // assert
      expect(
        sampleTestData.props,
        [
          sampleTestData.webUrl,
          sampleTestData.headline,
          sampleTestData.pubDate,
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
        final result = SearchResultItem.fromJson(tempData);

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
