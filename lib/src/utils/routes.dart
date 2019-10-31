import 'package:flutter/material.dart';
import '../ui/screens/login.dart';
import '../ui/screens/signup.dart';

class Routes {

  static const String LOGIN = '/login';
  static const String SIGNUP = '/signup';

  static Widget toScreen(String route) {
    switch(route) {
      case LOGIN: return LoginScreen();
      case SIGNUP: return SignUpScreen();
      default: return LoginScreen();
    }
  }

}