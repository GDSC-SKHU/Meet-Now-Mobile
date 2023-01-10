import 'package:flutter/material.dart';
import 'package:meetnow/view/login/login.dart';
import 'package:meetnow/view/making_promise/makingPromise.dart';
import 'package:meetnow/view/result/result.dart';
import 'package:meetnow/view/room_list/roomListView.dart';
import 'package:meetnow/view/splashScreen.dart';
import 'package:meetnow/view/time_table/success.dart';
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
          '/Login': (BuildContext context) => LoginScreen(),
          '/Result': (BuildContext context) => ResultScreen(),
          '/RoomListView': (BuildContext context) => RoomListView(),
          '/Success': (BuildContext context) => SuccessScreen(title: ""),
          '/MakingPromise': (BuildContext context) => MakingPromise(),
        },
      ),
    );
