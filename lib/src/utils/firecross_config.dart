import 'package:firecross/firecross.dart';

const String apiKey = 'AIzaSyBdH2gbbOihrCRAOfm2BNvD3vWhhZVCbd0';
const String authDomain = 'langtrans-app.firebaseapp.com';
const String databaseURL = 'https =//langtrans-app.firebaseio.com';
const String projectId = 'langtrans-app';
const String storageBucket = 'langtrans-app.appspot.com';
const String messagingSenderId = '30372035578';
bool _initialized = false;

class FirecrossConfig {
  static bool get initialized => _initialized;
  static void initalize() {
    FirecrossApp.initalizeApp(
      apiKey: apiKey,
      authDomain: authDomain,
      databaseURL: databaseURL,
      projectId: projectId,
      storageBucket: storageBucket,
      messagingSenderId: messagingSenderId,
    );
    _initialized = true;
  }
}
