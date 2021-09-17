import 'dart:async';
import 'dart:ui';
import 'package:chat_now/generated/i18n.dart';
import 'package:chat_now/utils/common_colors.dart';
import 'package:chat_now/utils/common_utils.dart';
import 'package:chat_now/utils/text_style.dart';
import 'package:chat_now/view/splash_view/splash_view_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var scaffoldKey = new GlobalKey<ScaffoldState>();

  FirebaseMessaging? _firebaseMessaging;
  SplashViewModel? mViewModel;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging!.getToken().then((String? token) {
      printf("firebase token=>" + token.toString());
      //AppPreferences().setDeviceToken(token.toString());
    });

    new Future.delayed(const Duration(seconds: 3), () {
      mViewModel = Provider.of<SplashViewModel>(context, listen: false);
      // timer for the splashscreen
      /*mViewModel!.getCurrentPayment(context);*/
      /*if (appModel!.isStart) {
        mViewModel!.startTimer(context);
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<SplashViewModel>(context);
    mViewModel!.mContext = context;
    print(String.fromCharCode(248));
    print("Get started");

    Widget _bottomButton = Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: double.infinity,
            child: InkWell(
              onTap: () {},
              child: Container(
                color: CommonColors.greenColor,
                child: Center(
                  child: Text(
                    S.of(context)!.getStarted,
                    style: CommonStyle.getRiftSoftStyle(
                        color: CommonColors.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        letterSpacing: 3.5),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: InkWell(
            onTap: () {},
            child: Container(
              height: double.infinity,
              color: CommonColors.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                  child: Icon(
                Icons.arrow_forward_ios,
                color: CommonColors.whiteColor,
                size: 20,
              )),
            ),
          ),
        )
      ],
    );

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      S.of(context)!.managePower,
                      textAlign: TextAlign.start,
                      style: CommonStyle.getGibsonStyle(
                          color: CommonColors.secondaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    child: Text(
                      S.of(context)!.effectiveApproach,
                      style: CommonStyle.getEuropaStyle(
                          color: CommonColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            )),
            mViewModel!.isStart
                ? Container(
                    color: Colors.grey,
                    height: 60,
                    child: _bottomButton,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
