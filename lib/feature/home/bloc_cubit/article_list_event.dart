part of 'article_list_bloc.dart';

abstract class ArticleListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ArticleItemEvent extends ArticleListEvent {
  ArticleItemEvent({
    required this.isResetting,
    required this.listType,
    this.keyword = "",
  });

  final bool isResetting;
  final int listType;
  final String keyword;

  @override
  List<Object?> get props {
    return [
      isResetting,
      listType,
      keyword,
    ];
  }
}
