import 'package:app_mobx/src/shared/router_app.dart';
import 'package:app_mobx/src/shared/styles/theme_app.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp().getThemeData,
      initialRoute: RouterApp.HOME_KEY,
      routes: {
        RouterApp.HOME_KEY: (_) => RouterApp.HOME_PAGE,
      },
    );
  }
}
