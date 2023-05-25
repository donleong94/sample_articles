import 'package:flutter/material.dart';
import 'package:sample_article_flutter/core/constant/value_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  UserPreferences({required this.prefs});

  final SharedPreferences prefs;

  static const String _localize = "localize";

  // Localization

  Future<void> setLocalizeSupport(String langCode, String countryCode) async {
    await prefs.setStringList(_localize, [langCode, countryCode]);
  }

  Locale getLocalizeSupport() {
    List<String> getLocal = prefs.getStringList(_localize) ?? [];

    if (getLocal.isEmpty) {
      return const Locale(
        ValueConstants.defaultLangCode,
        ValueConstants.defaultLangCountryCode,
      );
    } else {
      return Locale(getLocal[0], getLocal[1]);
    }
  }
}
