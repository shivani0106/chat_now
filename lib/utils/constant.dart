import 'package:flutter/material.dart';

import 'colorscheme.dart';

class AppConstants {
  /*--------Language Codes-------------------*/
  static const String LANGUAGE_ENGLISH = 'en';
  static const String LANGUAGE_NORWEGIAN = 'no';

  /*--------Device Type-------------------*/

  static var DEVICE_TYPE_ANDROID = "1";
  static var DEVICE_TYPE_IOS = "2";
  static var LOGIN_TYPE_NORMAL = "0";
  static var LOGIN_TYPE_GOOGLE = "1";
  static var LOGIN_TYPE_FACEBOOK = "2";

  static var START_SESSION = 'start_session';
  static var HOME = 'home';
  static var BOTTOMBAR = 'bottomBar';
}

const TextStyle kh1 = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

const TextStyle kh2 = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
const TextStyle kh3 = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const TextStyle kh4 = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

BoxDecoration roundCorners = BoxDecoration(
    borderRadius: BorderRadius.circular(30.0), color: primaryColor);

final optInputDecoration = InputDecoration(
    hintText: '0',
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: primaryColor)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ));
