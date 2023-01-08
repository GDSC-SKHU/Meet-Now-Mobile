import 'package:flutter/material.dart';
import 'package:miniproject/color_schemes.g.dart';
import 'package:miniproject/screnns/login.dart';
import 'package:miniproject/screnns/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Splash',
      theme: ThemeData(colorScheme: lightColorScheme),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
