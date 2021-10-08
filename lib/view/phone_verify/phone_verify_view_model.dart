import 'package:chat_now/database/firebase_cloud.dart';
import 'package:chat_now/models/user_master.dart';
import 'package:chat_now/utils/common_utils.dart';
import 'package:chat_now/view/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class PhoneVerifyViewModel with ChangeNotifier {
  BuildContext? mContext;
  FirebaseAuth? _auth = FirebaseAuth.instance;
  FirebaseCloud _firebaseCloud = FirebaseCloud();

  void attachContext(BuildContext context) {
    mContext = context;
  }

  void phoneSignIn({verificationId, smsCode, UserMaster? userMaster}) async {
    CommonUtils.showProgressDialog(mContext!);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    print("verificationId: " + verificationId + "otp: " + smsCode);
    final UserCredential authResult =
        await _auth!.signInWithCredential(credential);
    CommonUtils.hideProgressDialog(mContext!);
    print("authResult" + authResult.user!.uid);
    if (userMaster != null) {
      userMaster.uid = authResult.user!.uid;
    }
    signInCloud(userMaster!);
  }

  signInCloud(UserMaster data) {
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
