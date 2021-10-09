import 'package:chat_now/database/app_preferences.dart';
import 'package:chat_now/database/firebase_cloud.dart';
import 'package:chat_now/models/user_master.dart';
import 'package:chat_now/utils/common_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  BuildContext? mContext;
  FirebaseCloud? _firebaseCloud = FirebaseCloud();
  QuerySnapshot? userData;
  List<UserMaster> userList = [];
  AppPreferences _appPreferences = AppPreferences();
  UserMaster? myData;

  attachContext(BuildContext context) {
    mContext = context;
    _firebaseCloud!.initFirebase();
    getMyPersonalData();
  }

  getAllUser() async {
    userData = await _firebaseCloud!.firestoreUser!.get();
    userData!.docs.asMap().forEach((key, value) {
      UserMaster user = UserMaster.fromJson(value);
      if (user.uid != myData!.uid) userList.add(user);
    });
    print("user list length=>" + userList.length.toString());
    notifyListeners();
  }

  getMyPersonalData() async {
    myData = await _appPreferences.getUserDetails();
    await getAllUser();
    printf("My Data" + myData!.fullName.toString());
    notifyListeners();
  }
}
