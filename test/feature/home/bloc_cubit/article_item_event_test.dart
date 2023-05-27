import 'package:flutter_test/flutter_test.dart';

import '../../../general_data.dart';

void main() {
  test(
    "make sure the props value is correct",
    () async {
      // assert
      expect(
        articleItemEventTest.props,
        [
          articleItemEventTest.isResetting,
          articleItemEventTest.listType,
          articleItemEventTest.keyword,
        ],
      );
    },
  );
}
