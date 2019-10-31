import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
