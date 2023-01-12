import 'package:flutter/material.dart';
import 'package:meetnow/view/room_list/roomListView.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userNameController = TextEditingController();
  var name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('사용하실 이름을 입력하세요',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: TextFormField(
                  controller: userNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '이름',
                  ),
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                )),
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: ElevatedButton(
                child: Text(
                  "확인",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  if (await getData(name)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: RouteSettings(name: '/RoomListView'),
                        builder: (_) => RoomListView(),
                      ),
                    );
                  } else {
                    showToast();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }
}

Future<bool> getData(name) async {
  final prefs = await SharedPreferences.getInstance();
  var jsonData = {
    "username": name,
  };
  var body = jsonEncode(jsonData);
  var response = await http.post(
    Uri.http("35.230.73.173", "/signup"),
    body: body,
    headers: {'content-type': 'application/json', 'charset': 'utf-8'},
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    prefs.setString('username', name);
    prefs.setString('token', data['accessToken']);

    print(prefs.getString('token'));
    print(prefs.getString('username'));
    return true;
  } else {
    return false;
  }
}

void showToast() {
  Fluttertoast.showToast(
    msg: "중복된 이름입니다.",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.redAccent,
    fontSize: 20,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
