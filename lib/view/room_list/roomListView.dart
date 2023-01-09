import 'package:flutter/material.dart';
import 'package:meetnow/view/room_list/makePromiseButton.dart';
import 'package:meetnow/view/room_list/navBar.dart';
import 'package:meetnow/view/room_list/promiseList.dart';

class RoomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
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
    );
  }
}
