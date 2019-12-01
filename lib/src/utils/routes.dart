import 'package:flutter/material.dart';
import 'package:language_transfer/src/ui/screens/login.dart';
import 'package:language_transfer/src/ui/screens/signup.dart';
import 'package:language_transfer/src/ui/screens/home.dart';

class Routes {
  static const String LOGIN = '/login';
  static const String SIGNUP = '/signup';
  static const String HOME = '/home';

  static Widget toScreen(String route) {
    switch (route) {
      case LOGIN:
        return LoginScreen();
      case SIGNUP:
        return SignupScreen();
      case HOME:
        return HomeScreen();
      default:
        return LoginScreen();
    }
  }
}
