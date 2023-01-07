import 'package:flutter/material.dart';
import 'package:meetnow/view/room_list/navBar.dart';
import 'package:meetnow/view/room_list/promiseList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class MakePromiseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, size: 32),
      onPressed: () {},
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black,
    );
  }
}
