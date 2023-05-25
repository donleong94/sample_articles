import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_article_flutter/app.dart';
import 'package:sample_article_flutter/core/constant/url_constants.dart';
import 'package:sample_article_flutter/start/build_environment.dart';
import 'package:sample_article_flutter/start/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BuildEnvironment.init(
    baseUrl: UrlConstants.baseUrl,
  );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await ScreenUtil.ensureScreenSize();
  await startup();

  runApp(const App());
}
