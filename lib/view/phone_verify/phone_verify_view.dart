import 'package:chat_now/generated/i18n.dart';
import 'package:chat_now/models/user_master.dart';
import 'package:chat_now/utils/common_colors.dart';
import 'package:chat_now/utils/text_style.dart';
import 'package:chat_now/view/phone_verify/phone_verify_view_model.dart';
import 'package:chat_now/view/sign_up/reusable_textfield.dart';
import 'package:chat_now/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneVerification extends StatefulWidget {
  final String? verificationId;
  final UserMaster? userMaster;

  PhoneVerification({this.verificationId, this.userMaster});

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  TextEditingController codeController = TextEditingController();
  PhoneVerifyViewModel? mViewModel;

  @override
  void initState() {
    mViewModel = Provider.of<PhoneVerifyViewModel>(context, listen: false);
    mViewModel!.attachContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<PhoneVerifyViewModel>(context);
    mViewModel!.mContext = context;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CommonColors.primaryColor,
        elevation: 0.0,
        title: Text(
          "Phone authentication",
          style: CommonStyle.getEuropaStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: CommonColors.whiteColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 100),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              reusableTextField(
                  hint: "OTP",
                  keyboardType: TextInputType.number,
                  controller: codeController),
              SizedBox(
                height: 50,
              ),
              CustomButtonWithOpacity(
                callback: () {
                  FocusScope.of(context).unfocus();
                  mViewModel!.phoneSignIn(
                      verificationId: widget.verificationId,
                      smsCode: codeController.text,
                      userMaster: widget.userMaster);
                },
                title: S.of(context)!.signIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
