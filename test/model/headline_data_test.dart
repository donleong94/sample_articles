import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sample_article_flutter/model/headline_data.dart';

import '../general_data.dart';

void main() {
  test(
    "make sure the props value is correct",
    () async {
      // assert
      expect(
        headlineTestData.props,
        [
          headlineTestData.main,
        ],
      );
    },
  );

  group("fromJson", () {
    test(
      "make sure the fromJson function returns a valid model object when reading valid JSON",
      () async {
        // arrange
        final Map<String, dynamic> tempData = json.decode(headlineTestJson);

        // act
        final result = HeadlineData.fromJson(tempData);

        // assert
        expect(result, headlineTestData);
      },
    );
  });

  group("toJson", () {
    test(
      "make sure the toJson function returns a JSON value in the form of a valid map object when converting model data to JSON",
      () async {
        // arrange
        final tempData = headlineTestData.toJson();

        // assert
        expect(tempData, headlineTestMap);
      },
    );
  });
}
