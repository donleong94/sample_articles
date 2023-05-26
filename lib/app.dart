import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/style/app_theme.dart';
import 'package:sample_article_flutter/core/util/app_scrollbar_behavior.dart';
import 'package:sample_article_flutter/local/user_preferences.dart';
import 'package:sample_article_flutter/start/app_router.dart';
import 'package:sample_article_flutter/start/service_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = sl<AppRouter>();

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        LocalJsonLocalization.delegate.directories = ["lib/i18n"];

        return Directionality(
          textDirection: TextDirection.ltr,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: AutoRouterDelegate(
              router,
              initialRoutes: [
                const HomeRoute(),
              ],
            ),
            routeInformationParser: router.defaultRouteParser(),
            title: "",
            theme: AppTheme.getTheme,
            builder: (ctx, child) {
              return ScrollConfiguration(
                behavior: AppScrollBehavior(),
                child: Theme(
                  data: AppTheme.getTheme,
                  child: child!,
                ),
              );
            },
            localizationsDelegates: [
              // delegate from flutter_localization
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              // delegate from localization package.
              LocalJsonLocalization.delegate,
            ],
            locale: sl<UserPreferences>().getLocalizeSupport(),
            supportedLocales: const [
              Locale("en", "US"),
            ],
          ),
        );
      },
    );
  }
}

void setStatusBarIconLight() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColor.commonTransparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

void setStatusBarIconDark() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColor.commonTransparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}
