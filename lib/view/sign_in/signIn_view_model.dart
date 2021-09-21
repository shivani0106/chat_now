import 'dart:convert';
import 'dart:io';
import 'package:chat_now/database/app_preferences.dart';
import 'package:chat_now/utils/common_utils.dart';
import 'package:chat_now/view/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SignInViewModel with ChangeNotifier {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  AppPreferences appPreferences = new AppPreferences();
  String? deviceToken;
  bool isSignInScreen = true;
  bool success = false;
  BuildContext? mContext;
  bool startSession = false;
  String? currentSessionId;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> attachContext({BuildContext? context}) async {
    mContext = context;
    deviceToken = await appPreferences.getDeviceToken();
  }

  bool? isSignIn() {
    isSignInScreen = !isSignInScreen;
    notifyListeners();
  }

  void loginWithGoogle() async {
    printf("LOGIN");
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

    try {
      GoogleSignIn signIn = await _googleSignIn.signIn();
    } catch (e) {
      printf("Goggle Login Error =>" + e.toString());
    }
  }
}
