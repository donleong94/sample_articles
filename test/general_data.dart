import 'package:sample_article_flutter/core/constant/value_constants.dart';
import 'package:sample_article_flutter/feature/home/bloc_cubit/article_list_bloc.dart';
import 'package:sample_article_flutter/model/headline_data.dart';
import 'package:sample_article_flutter/model/most_viewed_result_item.dart';
import 'package:sample_article_flutter/model/search_result_item.dart';
import 'package:sample_article_flutter/network/misc/general_status.dart';

// HeadlineData

const headlineTestJson = """{
    "main": "Test Title"
  }""";

const headlineTestData = HeadlineData(
  main: "Test Title",
);

const headlineTestMap = {
  "main": "Test Title",
};

// MostViewedResultItem

const mostViewResultTestJson = """{
    "url": "https://www.test.com/",
    "published_date": "2023-05-31",
    "title": "Test Title"
  }""";

const mostViewedResultTestData = MostViewedResultItem(
  url: "https://www.test.com/",
  publishedDate: "2023-05-31",
  title: "Test Title",
);

const mostViewResultTestMap = {
  "url": "https://www.test.com/",
  "published_date": "2023-05-31",
  "title": "Test Title",
};

// SearchResultItem

const searchResultTestJson = """{
    "web_url": "https://www.test.com/",
    "headline": {
      "main": "Test Title"
    },
    "pub_date": "2023-05-31"
  }""";

const searchResultTestData = SearchResultItem(
  webUrl: "https://www.test.com/",
  headline: headlineTestData,
  pubDate: "2023-05-31",
);

const searchResultTestMap1 = {
  "web_url": "https://www.test.com/",
  "headline": headlineTestData,
  "pub_date": "2023-05-31",
};

const searchResultTestMap2 = {
  "web_url": "https://www.test.com/",
  "headline": headlineTestMap,
  "pub_date": "2023-05-31",
};

// ArticleItemEvent

final articleItemEventTest = ArticleItemEvent(
  isResetting: true,
  listType: ValueConstants.mostViewedListType,
  keyword: "",
);

// ArticleListState

const articleListStateTest = ArticleListState(
  status: GeneralStatus.success,
  hasReachMax: true,
  currentPage: 1,
  resultList: [],
);
