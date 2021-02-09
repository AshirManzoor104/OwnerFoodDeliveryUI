import 'package:flutter/material.dart';
import 'package:delivery_owner/config/theme.dart';
import 'package:delivery_owner/model/account.dart';
import 'package:delivery_owner/model/pref.dart';
import 'package:delivery_owner/ui/login/createaccount.dart';
import 'package:delivery_owner/ui/login/forgot.dart';
import 'package:delivery_owner/ui/login/login.dart';
import 'package:delivery_owner/ui/main/mainscreen.dart';
import 'package:delivery_owner/ui/start/splash.dart';
import 'config/lang.dart';

//
// Theme
//
AppThemeData theme = AppThemeData();
//
// Language data
//
Lang strings = Lang();
//
// Account
//
Account account = Account();
Pref pref = Pref();

void main() {
  theme.init();
  strings.setLang(Lang.english); // set default language - English
  runApp(AppFoodDelivery());
}

class AppFoodDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _theme = ThemeData(
      fontFamily: 'Raleway',
      primarySwatch: theme.primarySwatch,
    );

    if (theme.darkMode) {
      _theme = ThemeData(
        fontFamily: 'Raleway',
        brightness: Brightness.dark,
        unselectedWidgetColor: Colors.white,
        primarySwatch: theme.primarySwatch,
      );
    }

    return MaterialApp(
      title: strings.get(10), // "Food Delivery Flutter App UI Kit",
      debugShowCheckedModeBanner: false,
      theme: _theme,
      initialRoute: '/splash',
      //initialRoute: '/main',
      routes: {
        '/splash': (BuildContext context) => SplashScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/forgot': (BuildContext context) => ForgotScreen(),
        '/createaccount': (BuildContext context) => CreateAccountScreen(),
        '/main': (BuildContext context) => MainScreen(),
      },
    );
  }
}

dprint(String str) {
  //
  // comment this line for release app
  //
  print(str);
}
