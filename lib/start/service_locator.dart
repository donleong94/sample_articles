import 'package:get_it/get_it.dart';
import 'package:sample_article_flutter/core/constant/value_constants.dart';
import 'package:sample_article_flutter/core/widget/custom_toast.dart';
import 'package:sample_article_flutter/local/user_preferences.dart';
import 'package:sample_article_flutter/network/misc/dio_client.dart';
import 'package:sample_article_flutter/network/misc/dio_interceptor_logger.dart';
import 'package:sample_article_flutter/network/misc/dio_interceptor_main.dart';
import 'package:sample_article_flutter/network/repository/article_repository.dart';
import 'package:sample_article_flutter/network/service/article_service.dart';
import 'package:sample_article_flutter/start/app_router.dart';
import 'package:sample_article_flutter/start/build_environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> startup() async {
  final prefs = await SharedPreferences.getInstance();

  // General

  sl.registerSingleton<AppRouter>(AppRouter());
  sl.registerLazySingleton<UserPreferences>(() => UserPreferences(prefs: prefs));
  sl.registerSingleton<CustomToast>(CustomToast.start());

  // Dio - Base + Interceptor + Logger

  sl.registerSingleton<DioClient>(
    DioClient.init(env!.baseUrl),
    instanceName: ValueConstants.articleClient,
  );

  sl<DioClient>(instanceName: ValueConstants.articleClient).addInterceptor(DioInterceptorMain());
  sl<DioClient>(instanceName: ValueConstants.articleClient).addInterceptor(dioInterceptorLogger);

  // Service

  sl.registerSingleton<ArticleService>(ArticleService(sl<DioClient>(instanceName: ValueConstants.articleClient)));

  // Repository

  sl.registerSingleton<ArticleRepository>(ArticleRepository(sl<ArticleService>()));
}
