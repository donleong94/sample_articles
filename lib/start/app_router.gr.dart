// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ArticleListRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArticleListScreen(
          key: args.key,
          listType: args.listType,
          searchStr: args.searchStr,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [ArticleListScreen]
class ArticleListRoute extends PageRouteInfo<ArticleListRouteArgs> {
  ArticleListRoute({
    Key? key,
    required int listType,
    String searchStr = "",
    List<PageRouteInfo>? children,
  }) : super(
          ArticleListRoute.name,
          args: ArticleListRouteArgs(
            key: key,
            listType: listType,
            searchStr: searchStr,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleListRoute';

  static const PageInfo<ArticleListRouteArgs> page =
      PageInfo<ArticleListRouteArgs>(name);
}

class ArticleListRouteArgs {
  const ArticleListRouteArgs({
    this.key,
    required this.listType,
    this.searchStr = "",
  });

  final Key? key;

  final int listType;

  final String searchStr;

  @override
  String toString() {
    return 'ArticleListRouteArgs{key: $key, listType: $listType, searchStr: $searchStr}';
  }
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
