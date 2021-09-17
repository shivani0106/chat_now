import 'dart:convert';

import 'package:chat_now/utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class SplashViewModel with ChangeNotifier {
  bool isStart = false;

  BuildContext? mContext;

  late String _deviceToken;
  bool startSession = false;
  String? currentSessionId;

  redirectToSignInView(BuildContext context) {}

  /*void getActiveSession() async {
    await appPreferences.getUserActiveSession().then((value) {
      if (value != null) {
        startSession = true;
      } else {
        startSession = false;
      }
    });
    notifyListeners();
  }*/

}
