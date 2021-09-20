import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'common_colors.dart';

void printf(dynamic value) {
  if (!kReleaseMode) debugPrint(value.toString());
}

bool isVisaCard = true;

class CommonUtils {
  static bool isShowing = false;
  static RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  static Function mathFunc = (Match match) => '${match[1]},';

  //return device screen height
  double screenHeight(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return MediaQuery.of(context).size.height;
  }

  //return device screen width
  double screenWidth(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return MediaQuery.of(context).size.width;
  }

  static bool isEmpty(String string) {
    return string == null || string.length == 0;
  }

  static bool isvalidEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    return (!regex.hasMatch(email)) ? false : true;
  }

  static bool isvalidPhone(String phone) {
    return phone.length == 10 ? true : false;
  }

  static void showSnackBar(String message, globalKey, {color, time}) {
    final snackBar = SnackBar(
      backgroundColor: color ?? Colors.red,
      content: Text(message),
      duration: Duration(seconds: time != null ? time : 2),
    );
    globalKey.currentState.showSnackBar(snackBar);
  }

  static void hideProgressDialog(BuildContext context) {
    if (isShowing) {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      isShowing = false;
    }
  }

  static void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showGreenToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: CommonColors.greenColor.withOpacity(0.6),
        textColor: CommonColors.whiteColor,
        fontSize: 16.0);
  }

  static void showRedToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: CommonColors.red,
        textColor: CommonColors.whiteColor,
        fontSize: 16.0);
  }

  static hideKeyboard(context) {
    try {
      FocusScope.of(context).unfocus();
    } catch (e) {}
  }

  static void showProgressDialog(BuildContext context, {from}) {
    isShowing = true;
    showDialog(
        barrierDismissible: false,
        useSafeArea: true,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        CommonColors.primaryColor),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Widget? getItemProgressBar() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

Future<void> pushScreen(
    {required BuildContext context, required Widget screen}) async {
  await Navigator.push(context, CupertinoPageRoute(builder: (context) {
    return screen;
  }));
}
