import 'package:chat_now/database/firebase_cloud.dart';
import 'package:chat_now/models/user_master.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  BuildContext? mContext;
  FirebaseCloud? _firebaseCloud = FirebaseCloud();
  QuerySnapshot? userData;
  List<UserMaster> userList = [];

  attachContext(BuildContext context) {
    mContext = context;
    _firebaseCloud!.initFirebase();
    getAllUser();
  }

  getAllUser() async {
    userData = await _firebaseCloud!.firestoreUser!.get();
    userData!.docs.asMap().forEach((key, value) {
      UserMaster user = UserMaster.fromJson(value);
      userList.add(user);
      print("user list length=>" + userList.length.toString());
    });
    notifyListeners();
  }
}
