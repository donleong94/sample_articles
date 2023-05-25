import 'package:flutter/material.dart';
import 'package:sample_article_flutter/start/app_router.dart';
import 'package:sample_article_flutter/start/service_locator.dart';

/// Get global context
class NavigationService {
  static BuildContext? get ctx {
    return sl<AppRouter>().navigatorKey.currentState?.context;
  }

  static isThereCurrentDialogShowing(BuildContext context) {
    return ModalRoute.of(context)?.isCurrent != true;
  }
}
