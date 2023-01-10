import 'package:flutter/material.dart';
import 'package:meetnow/view/room_list/roomListView.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('사용하실 이름을 입력하세요',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            Container(
                width: 400,
                height: 50,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '이름',
                  ),
                  style: TextStyle(color: Colors.black),
                )),
            ElevatedButton(
              child: Text(
                "확인",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: RouteSettings(name: '/RoomListView'),
                    builder: (_) => RoomListView(),
                  ),
                ); //목록페이지로이동
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, minimumSize: Size(400, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
