import 'package:chat_now/generated/i18n.dart';
import 'package:chat_now/models/country_master.dart';
import 'package:chat_now/utils/common_colors.dart';
import 'package:chat_now/utils/common_utils.dart';
import 'package:chat_now/view/sign_up/choose_country.dart';
import 'package:chat_now/view/sign_up/reusable_textfield.dart';
import 'package:chat_now/view/sign_up/signup_view_model.dart';
import 'package:chat_now/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignupViewModel? mViewModel;


  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confimPasswordController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();
  TextEditingController postalCodeController = new TextEditingController();
  TextEditingController postalAddressController = new TextEditingController();

  var scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xfff3f3f4),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    Future.delayed(Duration.zero, () {
      mViewModel!.attachContext(context);
      mViewModel!.initCountryList(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<SignupViewModel>(context);

    final nationalityDropDown = mViewModel!.selectedNationality != null
        ? InkWell(
            onTap: () {
              _openNationalityPickerDialog();
            },
            child: Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                color: CommonColors.whiteColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      //height: 20,
                      padding: EdgeInsets.only(left: 12),
                      width: 60,
                      child: Text("+" +
                          mViewModel!.selectedNationality!.countryCode
                              .toString()),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: CommonColors.blackB6,
                  ),
                ],
              ),
            ),
          )
        : Container();

    return Scaffold(
      backgroundColor: Colors.transparent,
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: Container(
        /*decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage(LocalImages.ic_signin_bg),
              fit: BoxFit.contain),
        ),*/
        //   height: CommonUtils().screenHeight(context) * 0.8,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      bottom: CommonUtils().screenHeight(context) * 0.08),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      reusableTextField(
                          hint: S.of(context)!.email + ":",
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          hint: S.of(context)!.password + ":",
                          obscureText: true,
                          controller: passwordController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          hint: S.of(context)!.confirmPassword + ":",
                          obscureText: true,
                          controller: confimPasswordController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          hint: S.of(context)!.fullName + ":",
                          controller: fullNameController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          hint: S.of(context)!.phone + ":",
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          country: nationalityDropDown),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          hint: S.of(context)!.address + ":",
                          controller: addressController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          hint: S.of(context)!.postalCode + ":",
                          keyboardType: TextInputType.number,
                          controller: postalCodeController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          hint: S.of(context)!.postalAddress + ":",
                          controller: postalAddressController,
                          textInputAction: TextInputAction.done),
                    ],
                  ),
                ),
                //* ..........................Sign Up Button....................*//*
                Column(
                  children: [
                    CustomButton(
                      callback: () {
                        FocusScope.of(context).unfocus();

                        if (isValid()!) {}
                      },
                      title: S.of(context)!.register,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openNationalityPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => ChooseCountryDialog(
        title: S.of(context)!.country,
        countryList: mViewModel!.nationalityList,
        onCountrySelected: (CountryDetails country) {
          Navigator.pop(context);
          mViewModel!.selectedNationality = country;
          mViewModel!.notifyListeners();
        },
      ),
    );
  }

  bool? isValid() {
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
    } else if (passwordController.text != confimPasswordController.text) {
      CommonUtils.showSnackBar(S.of(context)!.passwordNotMatch, scaffoldKey);
      return false;
    } else if (fullNameController.text.isEmpty) {
      CommonUtils.showSnackBar(S.of(context)!.enterfullName, scaffoldKey);
      return false;
    } else if (phoneController.text.isEmpty) {
      CommonUtils.showSnackBar(S.of(context)!.enterPhone, scaffoldKey);
      return false;
    } else if (addressController.text.isEmpty) {
      CommonUtils.showSnackBar(
          S.of(context)!.please + S.of(context)!.enterStreetAddress,
          scaffoldKey);
      return false;
    }
    /* else if (!CommonUtils.isvalidPhone(phoneController.text)) {
      CommonUtils.showSnackBar("please enter valid phoneNumber", scaffoldKey);
      return false;
    } */
    else {
      return true;
    }
  }
}
