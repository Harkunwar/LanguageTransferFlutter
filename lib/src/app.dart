import 'package:firecross/firecross.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_transfer/src/utils/routes.dart';

class App extends StatelessWidget {
  static bool loggedIn = false;

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
      home: StreamBuilder<FirecrossUser>(
        stream: FirecrossAuth.instance.onAuthStateChanged,
        builder: (context, AsyncSnapshot<FirecrossUser> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            if (loggedIn != false) {
              loggedIn = false;
              Future(() {
                Navigator.of(context).popUntil((route) => route.isFirst);
              });
            }
            return Routes.toScreen(Routes.LOGIN);
          }
          if (loggedIn != true) {
            loggedIn = true;
            Future(() {
              Navigator.of(context).popUntil((route) => route.isFirst);
            });
          }
          return Routes.toScreen(Routes.HOME);
        },
      ),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return Routes.toScreen(settings.name);
    });
  }
}
