import 'package:chat_now/database/app_preferences.dart';
import 'package:chat_now/view/home/home_view.dart';
import 'package:chat_now/view/sign_in/sign_in_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  bool isStart = false;

  BuildContext? mContext;

  late String _deviceToken;
  bool startSession = false;
  String? currentSessionId;
  AppPreferences _appPreferences = AppPreferences();

  redirectToSignInView(BuildContext context) {
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => SignInView()));
  }

  redirectToHomeView(BuildContext context) {
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => HomeView()));
  }

  void getActiveSession() async {
    await _appPreferences.getUserDetails().then((value) {
      if (value != null) {
        redirectToHomeView(mContext!);
      } else {
        redirectToSignInView(mContext!);
      }
    });
    notifyListeners();
  }
}
