import 'package:flutter/material.dart';
import '../ui/screens/signin.dart';
import '../ui/screens/signup.dart';
import '../ui/screens/splash_screen.dart';

class Routes {

  static const String LOGIN = '/login';
  static const String SIGNUP = '/signup';
  static const String SPLASHSCREEN = '/splash_screen';

  static Widget toScreen(String route) {
    switch(route) {
      case LOGIN: return SignInScreen();
      case SIGNUP: return SignUpScreen();
      case SPLASHSCREEN: return SplashScreen();
      default: return SignInScreen();
    }
  }

}