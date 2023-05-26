part of 'article_list_bloc.dart';

class ArticleListState extends Equatable {
  const ArticleListState({
    this.status = GeneralStatus.init,
    this.hasReachMax = false,
    this.currentPage = 0,
    this.resultList = const [],
  });

  final GeneralStatus status;
  final bool hasReachMax;
  final int currentPage;
  final List<dynamic> resultList;

  ArticleListState copyWith({
    GeneralStatus? status,
    bool? hasReachMax,
    int? currentPage,
    List<dynamic>? resultList,
  }) {
    return ArticleListState(
      status: status ?? this.status,
      hasReachMax: hasReachMax ?? this.hasReachMax,
      currentPage: currentPage ?? this.currentPage,
      resultList: resultList ?? this.resultList,
    );
  }

  @override
  List<Object?> get props {
    return [
      status,
      hasReachMax,
      currentPage,
      resultList,
    ];
  }
}
