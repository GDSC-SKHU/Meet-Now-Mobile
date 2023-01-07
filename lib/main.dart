import 'package:flutter/material.dart';
import 'package:meetnow/view/room_list/makePromiseButton.dart';
import 'package:meetnow/view/room_list/navBar.dart';
import 'package:meetnow/view/room_list/promiseList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSans'),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              NavBar(),
              Divider(thickness: 1.0, color: Colors.grey),
              PromiseList(),
              MakePromiseButton(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
