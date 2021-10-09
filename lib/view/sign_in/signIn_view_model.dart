import 'dart:convert';

import 'package:chat_now/database/app_preferences.dart';
import 'package:chat_now/database/firebase_cloud.dart';
import 'package:chat_now/models/user_master.dart';
import 'package:chat_now/utils/common_utils.dart';
import 'package:chat_now/view/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  FirebaseCloud _firebaseCloud = FirebaseCloud();
  User? user;
  AppPreferences _appPreferences = AppPreferences();

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
    GoogleSignIn _googleSignIn = GoogleSignIn();
    CommonUtils.showProgressDialog(mContext!);

    try {
      GoogleSignInAccount? _googleSignInAccount = await _googleSignIn.signIn();
      if (_googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await _googleSignInAccount.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        try {
          UserCredential? userCredential =
              await _auth.signInWithCredential(credential);
          user = userCredential.user;
          printf("EMAIL=>" + user!.email.toString());
          CommonUtils.hideProgressDialog(mContext!);

          if (userCredential.additionalUserInfo!.isNewUser) {
            if (user != null) {
              UserMaster userMaster = UserMaster(
                  uid: user!.uid,
                  fullName: user!.displayName,
                  email: user!.email);
              signInCloud(userMaster);
            }
          } else {
            Navigator.pushAndRemoveUntil(
                mContext!,
                CupertinoPageRoute(builder: (context) => HomeView()),
                (route) => false);
          }
        } catch (e) {
          print("Error During get credential from Firebase Authentication:" +
              e.toString());
        }
      }
    } catch (e) {
      printf("Goggle Login Error =>" + e.toString());
    }
  }

  signInCloud(UserMaster data) async {
    await _appPreferences.setUserLoginDetails(json.encode(data));
    _firebaseCloud.initFirebase();
    _firebaseCloud.firestoreUser!.add(data.toJson()).then((value) {
      print("User data => " + value.id);
      if (value != null) {
        Navigator.pushAndRemoveUntil(
            mContext!,
            CupertinoPageRoute(builder: (context) => HomeView()),
            (route) => false);
      }
    });
  }
}
