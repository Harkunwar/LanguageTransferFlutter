import 'package:flutter/material.dart';
import '../ui/screens/signin.dart';
import '../ui/screens/signup.dart';

class Routes {

  static const String LOGIN = '/login';
  static const String SIGNUP = '/signup';

  static Widget toScreen(String route) {
    switch(route) {
      case LOGIN: return SignInScreen();
      case SIGNUP: return SignUpScreen();
      default: return SignInScreen();
    }
  }

}