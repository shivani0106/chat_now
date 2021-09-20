import 'dart:io';

import 'package:chat_now/generated/i18n.dart';
import 'package:chat_now/utils/common_colors.dart';
import 'package:chat_now/utils/common_utils.dart';
import 'package:chat_now/utils/constant.dart';
import 'package:chat_now/utils/local_images.dart';
import 'package:chat_now/utils/text_style.dart';
import 'package:chat_now/view/sign_in/signIn_view_model.dart';
import 'package:chat_now/view/sign_up/reusable_textfield.dart';
import 'package:chat_now/view/sign_up/sign_up_view.dart';
import 'package:chat_now/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  var scaffoldKey = new GlobalKey<ScaffoldState>();

  SignInViewModel? mViewModel;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      mViewModel?.attachContext(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<SignInViewModel>(context);

    Widget appBarButton = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () => {mViewModel!.isSignIn()},
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mViewModel!.isSignInScreen
                          ? CommonColors.primaryColor
                          : CommonColors.whiteColor),
                  child: Text(
                    S.of(context)!.signIn.toUpperCase(),
                    style: CommonStyle.getGibsonStyle(
                        fontSize: 12,
                        color: mViewModel!.isSignInScreen
                            ? CommonColors.whiteColor
                            : CommonColors.gray78),
                  ))),
          TextButton(
              onPressed: () => {mViewModel!.isSignIn()},
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mViewModel!.isSignInScreen
                          ? CommonColors.whiteColor
                          : CommonColors.primaryColor),
                  child: Text(
                    S.of(context)!.signUp.toUpperCase(),
                    style: CommonStyle.getGibsonStyle(
                        fontSize: 12,
                        color: mViewModel!.isSignInScreen
                            ? CommonColors.gray78
                            : CommonColors.whiteColor),
                  ))),
        ],
      ),
    );

    final _socialLogin = Container(
      child: Row(
        children: [
          Container(
            child: Image.asset(LocalImages.ic_google_logo),
          ),
          Container(
            child: Image.asset(LocalImages.ic_facebook_logo),
          )
        ],
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: CommonColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: appBarButton,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 200,
              /*height: CommonUtils().screenHeight(context) < 600 ? 300 : 418,*/
              child: Image.asset(
                LocalImages.ic_signin_bg,
              ),
            ),
          ),
          mViewModel!.isSignInScreen
              ? Container(
                  //height: CommonUtils().screenHeight(context) * 0.75,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  //  margin: EdgeInsets.only(top: 20),
                  /*decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(LocalImages.ic_signin_bg),
                  fit: BoxFit.contain,
                ),
              ),*/
                  child: SingleChildScrollView(
                    child: Container(
                      // height: CommonUtils().screenHeight(context) * 0.5,
                      margin: EdgeInsets.only(
                          top: CommonUtils().screenHeight(context) < 600
                              ? 80
                              : Platform.isAndroid
                                  ? 150
                                  : 130),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
/*....................................Log Back into your Account.....................*/
                          reusableTextField(
                              hint: S.of(context)!.email + ":",
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController),
                          SizedBox(
                            height: 25,
                          ),
                          reusableTextField(
                              hint: S.of(context)!.password + ":",
                              obscureText: true,
                              controller: passwordController),
                          SizedBox(
                            height: 25,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'ForgotPassword');
                              },
                              child: Text(
                                S.of(context)!.forgotPassword.toUpperCase() +
                                    " ?",
                                style: CommonStyle.getGibsonStyle(
                                    color: CommonColors.black23,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          /* ..........................Sign In Now Button....................*/
                          CustomButtonWithOpacity(
                            callback: () {
                              FocusScope.of(context).unfocus();
                              if (isValid(context)!) {}
                            },
                            title: S.of(context)!.signIn,
                          ),
                          _socialLogin
                        ],
                      ),
                    ),
                  ),
                )
              : SignUpView(),
        ],
      ),
    );
  }

  bool? isValid(BuildContext context) {
    if (emailController.text.isEmpty) {
      CommonUtils.showSnackBar(
          S.of(context)!.please + S.of(context)!.enterEmail, scaffoldKey);
      return false;
    } else if (!CommonUtils.isvalidEmail(emailController.text)) {
      CommonUtils.showSnackBar(S.of(context)!.enterValidEmail, scaffoldKey);
    } else if (passwordController.text.isEmpty) {
      CommonUtils.showSnackBar(
          S.of(context)!.please + S.of(context)!.enterPassword, scaffoldKey);
      return false;
    } else {
      return true;
    }
  }
}
