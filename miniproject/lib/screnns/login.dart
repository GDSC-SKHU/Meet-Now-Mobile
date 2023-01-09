import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/color_schemes.g.dart';
import 'package:miniproject/screnns/success.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(colorScheme: lightColorScheme),
        home: Scaffold(
//            appBar: AppBar(title: Text(title)),
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
                    initialValue: '이름',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.grey),
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
                          builder: (_) => SuccessScreen())); //목록페이지로이동
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow, minimumSize: Size(400, 50)),
              ),
            ],
          ),
        )));
  }
}
