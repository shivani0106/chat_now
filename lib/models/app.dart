import 'dart:convert';

import 'package:chat_now/database/app_preferences.dart';
import 'package:chat_now/utils/common_utils.dart';
import 'package:chat_now/utils/constant.dart';
import 'package:flutter/material.dart';

class AppModel with ChangeNotifier {
  bool darkTheme = false;
  bool isLoading = true;
  String locale = AppConstants.LANGUAGE_NORWEGIAN;
  AppPreferences appPreferences = new AppPreferences();



  List<Language> lanName = [
    Language(language: 'English', languageCode: AppConstants.LANGUAGE_ENGLISH),
    Language(
        language: 'Norwegian', languageCode: AppConstants.LANGUAGE_NORWEGIAN)
  ];
  String? currentName = AppConstants.LANGUAGE_NORWEGIAN;


  void updateTheme(bool theme) {
    darkTheme = theme;
    notifyListeners();
  }

  void changeLanguage() async {
    String? locale = await appPreferences.getLanguageCode();
    if (locale != null) {
      if (CommonUtils.isEmpty(locale)) {
        appPreferences.setLanguageCode(this.locale);
        locale = this.locale;
      }
      this.locale = locale;
      printf("MMMMMMMM" + locale);
    } else {
      printf("NNNNNNN");
      AppPreferences().setLanguageCode(AppConstants.LANGUAGE_NORWEGIAN);
      this.locale = AppConstants.LANGUAGE_NORWEGIAN;
    }

    notifyListeners();
  }
}

class App {
  Map<String, dynamic> appConfig;

  App(this.appConfig);
}

class Language {
  String? language;
  String? languageCode;

  Language({this.language, this.languageCode});
}
