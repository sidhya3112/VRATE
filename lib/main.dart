import 'package:flutter/material.dart';
import 'package:vrate/login.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/splash_screen': (BuildContext context) => SplashScreen(),
          '/login': (BuildContext context) => Login()
        },
      );
  }
}

