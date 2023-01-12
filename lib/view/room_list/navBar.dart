import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meetnow/view/room_list/roomListView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final roomCodeController = TextEditingController();
  var roomCode;

  Future<bool> postInvitation() async {
    final prefs = await SharedPreferences.getInstance();
    var body = jsonEncode({"invitationCode": roomCode});
    var response = await http.post(
        Uri.http(
          "35.230.73.173",
          "/rooms/invitation",
        ),
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
          'content-type': 'application/json',
          'charset': 'utf-8',
        },
        body: body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(
          Icons.meeting_room_outlined,
          size: 30,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  '참가할 방 번호를 입력해 주세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: TextField(
                  controller: roomCodeController,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                    hintText: '0000',
                  ),
                  onChanged: (value) {
                    setState(() {
                      roomCode = value;
                    });
                  },
                ),
                actions: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber),
                      child: Text('확인'),
                      onPressed: () async {
                        if (await postInvitation()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              settings: RouteSettings(name: '/RoomListView'),
                              builder: (context) => RoomListView(),
                            ),
                          );
                        } else {
                          showToast();
                        }
                      },
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}

void showToast() {
  Fluttertoast.showToast(
    msg: "해당 방 코드의 방이 없습니다.",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.redAccent,
    fontSize: 20,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
