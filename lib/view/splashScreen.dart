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
  //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBQ0NFU1MiLCJhdWQiOiLso7zrj5nshJ0iLCJpYXQiOjE2NzM1MTc1NzgsImV4cCI6MTY3OTUxNzU3OH0.sJk__RGIHpzBxwMcWfudph-HrFBdJERqLixOdZaz3ISxDVoJlghmdrP-LelCpXBYkftBNXs7CAvQCnnykl9ZyA');
  prefs.remove('token');
  if (prefs.getString('token') != null) {
    return true;
  } else {
    return false;
  }
}
