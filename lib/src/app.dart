import 'dart:convert';

import 'package:firecross/firecross.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_transfer/src/utils/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initalizeFirecross(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language Transfer',
      theme: ThemeData(primaryColor: Colors.orange[200]),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return Routes.toScreen(settings.name);
    });
  }

  Future<void> initalizeFirecross(BuildContext context) async {
    final Map<String, dynamic> config = json.decode(
        await DefaultAssetBundle.of(context)
            .loadString('assets/config/firecross.json'));
    FirecrossApp.initalizeApp(
      apiKey: config['apiKey'],
      authDomain: config['authDomain'],
      databaseURL: config['databaseURL'],
      projectId: config['projectId'],
      storageBucket: config['storageBucket'],
      messagingSenderId: config['messagingSenderId'],
    );
  }
}
