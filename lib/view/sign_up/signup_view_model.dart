import 'dart:convert';
import 'dart:io';

import 'package:chat_now/database/app_preferences.dart';
import 'package:chat_now/models/app.dart';
import 'package:chat_now/models/country_master.dart';
import 'package:chat_now/utils/common_colors.dart';
import 'package:chat_now/utils/common_utils.dart';
import 'package:chat_now/utils/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupViewModel with ChangeNotifier {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext? mContext;
  AppPreferences appPreferences = new AppPreferences();
  bool success = false;

  CountryDetails? selectedNationality;
  List<CountryDetails> nationalityList = [];
  late List<DropdownMenuItem<CountryDetails>> nationalityDropdownMenuItems;

  void initCountryList(BuildContext context) async {
    nationalityList = Provider.of<AppModel>(context, listen: false).countryList;
    nationalityDropdownMenuItems =
        buildNationalityDropdownMenuItems(nationalityList);
    selectedNationality = nationalityDropdownMenuItems[159].value;
    if (selectedNationality == null) {
      selectedNationality = nationalityList[159];
    }
    notifyListeners();
  }

  void attachContext(BuildContext context) {
    mContext = context;
  }

  List<DropdownMenuItem<CountryDetails>> buildNationalityDropdownMenuItems(
      List arrayList) {
    List<DropdownMenuItem<CountryDetails>> items = [];
    for (CountryDetails object in arrayList) {
      items.add(
        DropdownMenuItem(
          value: object,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              object.name!,
              style: CommonStyle.getMetropolisStyle(
                  color: CommonColors.primaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
      );
    }
    return items;
  }
}
