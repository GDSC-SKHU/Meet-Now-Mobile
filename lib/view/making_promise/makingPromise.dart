import 'package:flutter/material.dart';

class MakingPromise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            TypePromiseName(),
          ]),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TypePromiseName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextField(
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          hintText: '약속 이름을 입력해 주세요.',
        ),
      ),
    );
  }
}
