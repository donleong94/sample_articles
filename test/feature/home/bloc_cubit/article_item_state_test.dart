import 'package:flutter_test/flutter_test.dart';

import '../../../general_data.dart';

void main() {
  test(
    "make sure the props value is correct",
    () async {
      // assert
      expect(
        articleListStateTest.props,
        [
          articleListStateTest.status,
          articleListStateTest.hasReachMax,
          articleListStateTest.currentPage,
          articleListStateTest.resultList,
        ],
      );
    },
  );

  test(
    "make sure copyWith use the correct value",
    () async {
      final copiedObj = articleListStateTest.copyWith(
        status: articleListStateTest.status,
        hasReachMax: articleListStateTest.hasReachMax,
        currentPage: articleListStateTest.currentPage,
        resultList: articleListStateTest.resultList,
      );

      // assert
      expect(
        copiedObj,
        articleListStateTest,
      );
    },
  );
}
