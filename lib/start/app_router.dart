import 'package:auto_route/auto_route.dart';
import 'package:sample_article_flutter/feature/home/screen/article_list_screen.dart';
import 'package:sample_article_flutter/feature/home/screen/home_screen.dart';
import 'package:sample_article_flutter/feature/home/screen/search_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends _$AppRouter {
  AppRouter() : super();

  @override
  RouteType get defaultRouteType {
    return const RouteType.material();
  }

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: "/home"),
    AutoRoute(page: SearchRoute.page, path: "/search"),
    AutoRoute(page: ArticleListRoute.page, path: "/articleList"),
  ];
}
