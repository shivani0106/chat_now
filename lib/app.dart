import 'dart:async';

import 'package:chat_now/database/app_preferences.dart';
import 'package:chat_now/generated/i18n.dart';
import 'package:chat_now/models/app.dart';
import 'package:chat_now/utils/constant.dart';
import 'package:chat_now/view/no_internet/no_internet_view.dart';
import 'package:chat_now/view/sign_in/signIn_view_model.dart';
import 'package:chat_now/view/sign_up/signup_view_model.dart';
import 'package:chat_now/view/splash_view/splash_view.dart';
import 'package:chat_now/view/splash_view/splash_view_model.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
final routeObserver = RouteObserver<PageRoute>();

class AppState extends State<App> /*with WidgetsBindingObserver*/ {
  static late BuildContext appContext;
  final _app = AppModel();
  AppPreferences appPreferences = new AppPreferences();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  var id;
  late StreamSubscription<ConnectivityResult> subscription;
  final Connectivity _connectivity = Connectivity();
  var isLaunch = true;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {}
  }

  @override
  void initState() {
    super.initState();
    subscription = _connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) async {
      // Got a new connectivity status!
      result = await _connectivity.checkConnectivity();
      print("network changed: " + result.toString());

      if (!isLaunch) {
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          print("back");
          Navigator.pop(mainNavigatorKey.currentContext!);
        } else {
          print("push");
          Navigator.push(
            mainNavigatorKey.currentContext!,
            MaterialPageRoute(builder: (context) => NoInternetView()),
          );
        }
      } else {
        print("is firsttime false");
        isLaunch = false;
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
        } else {
          print("push");
          Navigator.push(
            mainNavigatorKey.currentContext!,
            MaterialPageRoute(builder: (context) => NoInternetView()),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    appContext = context;
    return ChangeNotifierProvider<AppModel>.value(
      value: _app,
      child: Consumer<AppModel>(
        builder: (context, value, child) {
          value.isLoading = false;
          if (value.isLoading) {
            return Container(
              color: Theme.of(context).backgroundColor,
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<SplashViewModel>(
                  create: (_) => SplashViewModel()),
              ChangeNotifierProvider<SignInViewModel>(
                  create: (_) => SignInViewModel()),
              ChangeNotifierProvider<SignupViewModel>(
                  create: (_) => SignupViewModel())
            ],
            child: MaterialApp(
              builder: (BuildContext context, Widget? child) {
                final MediaQueryData data = MediaQuery.of(context);
                return MediaQuery(
                    child: child!, data: data.copyWith(textScaleFactor: 1));
              },
              title: 'ChatNow',
              navigatorKey: mainNavigatorKey,
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              /*locale: new Locale(Provider.of<AppModel>(context).locale, ""),*/
              localizationsDelegates: [
                S.delegate!,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate!.supportedLocales,
              localeListResolutionCallback: S.delegate!.listResolution(
                  fallback: const Locale(AppConstants.LANGUAGE_ENGLISH, '')),
              home: Splash(),
              routes: <String, WidgetBuilder>{},
            ),
          );
        },
      ),
    );
  }
}
