import 'package:flutter/material.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/Home/newhabit.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/mainpage.dart';
import 'package:monumental_habits/Design/Pages/OnBoarding/Pages/onboarding.dart';
import 'package:monumental_habits/Design/Pages/OnBoarding/Pages/splashscreen.dart';
import 'package:monumental_habits/Design/Pages/SignInUp/Signin.dart';
import 'package:monumental_habits/Design/Pages/SignInUp/forgetpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/SignInUp/Signup.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (context) => OnBoarding());
      case '/signin':
        return MaterialPageRoute(builder: (context) => SignInPage());
      case '/signup':
        return MaterialPageRoute(builder: (context) => SignUpPage());
      case '/forgetpassword':
        return MaterialPageRoute(builder: (context) => Forgetpassword());
      case '/mainpage':
        return MaterialPageRoute(builder: (context) => MainPage());
      case '/newhabit':
        return MaterialPageRoute(builder: (context) => Newhabit());

      default:
        return MaterialPageRoute(builder: (context) => SplashScreen());
    }
  }
}
