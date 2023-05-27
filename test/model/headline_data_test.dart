import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sample_article_flutter/model/headline_data.dart';

void main() {
  const sampleTestJson = """{
    "main": "Test Title"
  }""";

  const sampleTestData = HeadlineData(
    main: "Test Title",
  );

  const sampleTestMap = {
    "main": "Test Title",
  };

  test(
    "make sure the props value is correct",
    () async {
      // assert
      expect(
        sampleTestData.props,
        [
          sampleTestData.main,
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
        final result = HeadlineData.fromJson(tempData);

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
