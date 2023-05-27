import 'package:flutter_test/flutter_test.dart';
import 'package:sample_article_flutter/network/misc/general_status.dart';

void main() {
  group("general status", () {
    test(
      "test init status",
      () async {
        // arrange
        const testStatus = GeneralStatus.init;

        // assert
        expect(testStatus.isInit(), true);
      },
    );

    test(
      "test loading status",
      () async {
        // arrange
        const testStatus = GeneralStatus.loading;

        // assert
        expect(testStatus.isLoading(), true);
      },
    );

    test(
      "test success status",
      () async {
        // arrange
        const testStatus = GeneralStatus.success;

        // assert
        expect(testStatus.isSuccess(), true);
      },
    );

    test(
      "test error status",
      () async {
        // arrange
        const testStatus = GeneralStatus.error;

        // assert
        expect(testStatus.isError(), true);
      },
    );
  });
}
