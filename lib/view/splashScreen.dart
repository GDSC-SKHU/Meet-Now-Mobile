import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meetnow/view/login/login.dart';
import 'package:meetnow/view/room_list/roomListView.dart';
import 'package:meetnow/view/scheme/color_schemes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () async => {
        if (await checkToken())
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RoomListView()),
            ),
          }
        else
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            ),
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/clap.png', width: 100),
              Text(
                '지금!만나!',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> checkToken() async {
  final prefs = await SharedPreferences.getInstance();
  // prefs.setString('token',
  //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBQ0NFU1MiLCJhdWQiOiLsobDrj5nshJ0iLCJpYXQiOjE2NzM0MDg3NDMsImV4cCI6MTY3OTQwODc0M30.ZKGiuALamcpgQvys3jfJx76tt6uH1L_ubFx3Pj51Dn5waRMIhhwvytoRpy3nzLJopKGJSRzH8OIcxCH8ltV1Nw');
  if (prefs.getString('token') != null) {
    return true;
  } else {
    return false;
  }
}
