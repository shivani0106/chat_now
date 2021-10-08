import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloud {
  FirebaseFirestore? firebaseFirestore;
  CollectionReference? firestoreUser;

  void initFirebase() {
    firebaseFirestore = FirebaseFirestore.instance;
    firestoreUser = firebaseFirestore!.collection("User");
  }
}
