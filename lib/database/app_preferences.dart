import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  //------------------------------------------------------------- Preference Constants ------------------------------------------------------------

  // Constants for Preference-Value's data-type
  static const String PREF_TYPE_BOOL = "BOOL";
  static const String PREF_TYPE_INTEGER = "INTEGER";
  static const String PREF_TYPE_DOUBLE = "DOUBLE";
  static const String PREF_TYPE_STRING = "STRING";
  static const String KEY_LOGIN_DETAILS = "KEY_LOGIN_DETAILS";
  static const String KEY_PAYMENT_DETAILS = "KEY_PAYMENT_DETAILS";
  static const String KEY_CARD_DETAILS = "KEY_CARD_DETAILS";
  static const String KEY_ACTIVE_SESSION = "KEY_ACTIVE_SESSION";
  static const String KEY_OUTLET = "KEY_OUTLET";
  static const String KEY_ACCESS_TOKEN = "KEY_ACCESS_TOKEN";
  static const String KEY__USER_LOGIN_DETAILS = "KEY_USER_LOGIN_DETAILS";
  static const String KEY_LANGUAGE_CODE = "KEY_LANGUAGE_CODE";
  static const String KEY_DEVICE_TOKEN = "KEY_DEVICE_TOKEN";
  static const String KEY_CHAT_ADMIN_ID = "KEY_CHAT_ADMIN_ID";
  static const String KEY_NOTIFICATION_ON_OFF = "KEY_NOTIFICATION_ON_OFF";
  static const String KEY_LATITUDE = "KEY_LATITUDE";
  static const String KEY_LONGITUDE = "KEY_LONGITUDE";
  static const String KEY_APP_FIRST_LOADING = "KEY_APP_FIRST_LOADING";
  static const String ACCESS_TOKEN = "accessToken";

  // Constants for Preference-Name
  static const String PREF_IS_LOGGED_IN = "IS_LOGGED_IN";
  static const String IS_FIRST_TIME = "IS_FIRST_TIME";

  //-------------------------------------------------------------------- Variables -------------------------------------------------------------------
  // Future variable to check SharedPreference Instance is ready
  // This is actually a hack. As constructor is not allowed to have 'async' we cant 'await' for future value
  // SharedPreference.getInstance() returns Future<SharedPreference> object and we want to assign its value to our private _preference variable
  // In case if we don't 'await' for SharedPreference.getInstance() method, and in mean time if we access preferences using _preference variable we will get
  // NullPointerException for _preference variable, as it isn't yet initialized.
  // We need to 'await' _isPreferenceReady value for only once when preferences are first time requested in application lifecycle because in further
  // future requests, preference instance is already ready as we are using Singleton-Instance.
  late Future _isPreferenceInstanceReady;

  // Private variable for SharedPreferences
  SharedPreferences? _preferences;

// Store user data
 /* Future<UserdataMaster?> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String login_details = prefs.getString(KEY_LOGIN_DETAILS) ?? "";
    try {
      return UserdataMaster.fromJson(json.decode(login_details));
      // return UserDetails.fromJson(json.decode(login_details));
    } catch (e) {
      return null;
    }
  }

  Future<PaymentTypeMaster?> getUserPaymentDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String login_details = prefs.getString(KEY_PAYMENT_DETAILS) ?? "";
    try {
      return PaymentTypeMaster.fromJson(json.decode(login_details));
      // return UserDetails.fromJson(json.decode(login_details));
    } catch (e) {
      return null;
    }
  }

  Future<CurrentPaymentMaster?> getUserCardDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String login_details = prefs.getString(KEY_CARD_DETAILS) ?? "";
    try {
      return CurrentPaymentMaster.fromJson(json.decode(login_details));
      // return UserDetails.fromJson(json.decode(login_details));
    } catch (e) {
      return null;
    }
  }

  Future<StartSessionMaster?> getUserActiveSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String activeSession = prefs.getString(KEY_ACTIVE_SESSION) ?? "";
    try {
      return StartSessionMaster.fromJson(json.decode(activeSession));
      // return UserDetails.fromJson(json.decode(login_details));
    } catch (e) {
      return null;
    }
  }

  Future<Outlet?> getUserOutlet() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String activeSession = prefs.getString(KEY_OUTLET) ?? "";
    try {
      return Outlet.fromJson(json.decode(activeSession));
      // return UserDetails.fromJson(json.decode(login_details));
    } catch (e) {
      return null;
    }
  }*/

  /// ----------------------------------------------------------
  /// Method that saves the user decision on sorting order
  /// ----------------------------------------------------------
  Future<bool> setUserLoginDetails(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(KEY_LOGIN_DETAILS, value);
  }

  Future<bool> setUserPaymentDetails(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(KEY_PAYMENT_DETAILS, value);
  }

  Future<bool> setUserCardDetails(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(KEY_CARD_DETAILS, value);
  }

  Future<bool> setUserActiveSession(String value) async {
    print("setUserActiveSession invoked");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(KEY_ACTIVE_SESSION, value);
  }

  Future<bool> setUserOutlet(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(KEY_OUTLET, value);
  }

  Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_ACCESS_TOKEN) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user decision on sorting order
  /// ----------------------------------------------------------
  Future<bool> setAccessToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(KEY_ACCESS_TOKEN, value);
  }

  Future<String?> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_LANGUAGE_CODE) ?? null;
  }

  Future<bool> setLanguageCode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(KEY_LANGUAGE_CODE, value);
  }

  Future<bool> setIsFirstTime(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(IS_FIRST_TIME, value);
  }

  Future<bool> getIsFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(IS_FIRST_TIME) ?? true;
  }

  /// ------------------------------------------------------------
  /// Method that returns the user decision on sorting order
  /// ------------------------------------------------------------
  Future<String?> getDeviceToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_DEVICE_TOKEN) ?? '111';
  }

  /// ----------------------------------------------------------
  /// Method that saves the user decision on sorting order
  /// ----------------------------------------------------------
  Future<bool> setDeviceToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(KEY_DEVICE_TOKEN, value);
  }

  Future<bool> setAppFirstLoading(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(KEY_APP_FIRST_LOADING, value);
  }

  Future<bool> getAppFirstLoading() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(KEY_APP_FIRST_LOADING) ?? true;
  }

  //-------------------------------------------------------------------- Singleton ----------------------------------------------------------------------
  // Final static instance of class initialized by private constructor
  static final AppPreferences _instance = AppPreferences._internal();

  // Factory Constructor
  factory AppPreferences() => _instance;

  /// AppPreference Private Internal Constructor -> AppPreference
  /// @param->_
  /// @usage-> Initialize SharedPreference object and notify when operation is complete to future variable.
  AppPreferences._internal() {
    _isPreferenceInstanceReady = SharedPreferences.getInstance()
        .then((preferences) => _preferences = preferences);
  }

  //------------------------------------------------------- Getter Methods -----------------------------------------------------------
  // GETTER for isPreferenceReady future
  Future get isPreferenceReady => _isPreferenceInstanceReady;

  //--------------------------------------------------- Public Preference Methods -------------------------------------------------------------

  /// Set Logged-In Method -> void
  /// @param -> @required isLoggedIn -> bool
  /// @usage -> Set value of IS_LOGGED_IN in preferences
  void setLoggedIn({@required bool? isLoggedIn}) => _setPreference(
      prefName: PREF_IS_LOGGED_IN,
      prefValue: isLoggedIn,
      prefType: PREF_TYPE_BOOL);

  /// Get Logged-In Method -> Future<bool>
  /// @param -> _
  /// @usage -> Get value of IS_LOGGED_IN from preferences
  Future<bool> getLoggedIn() async =>
      await _getPreference(prefName: PREF_IS_LOGGED_IN) ??
      false; // Check value for NULL. If NULL provide default value as FALSE.

  //--------------------------------------------------- Private Preference Methods ----------------------------------------------------
  /// Set Preference Method -> void
  /// @param -> @required prefName -> String
  ///        -> @required prefValue -> dynamic
  ///        -> @required prefType -> String
  /// @usage -> This is a generalized method to set preferences with required Preference-Name(Key) with Preference-Value(Value) and Preference-Value's data-type.
  void _setPreference(
      {@required String? prefName,
      @required dynamic prefValue,
      @required String? prefType}) {
    // Make switch for Preference Type i.e. Preference-Value's data-type
    switch (prefType) {
      // prefType is bool
      case PREF_TYPE_BOOL:
        {
          _preferences!.setBool(prefName!, prefValue);
          break;
        }
      // prefType is int
      case PREF_TYPE_INTEGER:
        {
          _preferences!.setInt(prefName!, prefValue);
          break;
        }
      // prefType is double
      case PREF_TYPE_DOUBLE:
        {
          _preferences!.setDouble(prefName!, prefValue);
          break;
        }
      // prefType is String
      case PREF_TYPE_STRING:
        {
          _preferences!.setString(prefName!, prefValue);
          break;
        }
    }
  }

  /// Get Preference Method -> Future<dynamic>
  /// @param -> @required prefName -> String
  /// @usage -> Returns Preference-Value for given Preference-Name
  Future<dynamic> _getPreference({@required prefName}) async =>
      _preferences!.get(prefName);

  Future<bool> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
