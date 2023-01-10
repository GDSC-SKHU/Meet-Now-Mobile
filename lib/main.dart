import 'package:flutter/material.dart';
import 'package:meetnow/view/splashScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(
      MaterialApp(
          title: 'Meet Now',
          theme: ThemeData(primarySwatch: Colors.blue),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => SplashScreen(),
          }),
    );
