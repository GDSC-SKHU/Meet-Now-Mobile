import 'package:flutter/material.dart';

class MakingPromise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            TypePromiseName(),
            SettingPromiseHour(),
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
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: TextField(
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          hintText: '약속 이름을 입력해 주세요.',
        ),
      ),
    );
  }
}

class SettingPromiseHour extends StatefulWidget {
  @override
  State<SettingPromiseHour> createState() => _SettingPromiseHourState();
}

class _SettingPromiseHourState extends State<SettingPromiseHour> {
  int _promiseHours = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 40, 0, 0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '몇 시간 짜리 약속인가요?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                height: 40,
                alignment: Alignment.center,
                child: Text('${_promiseHours}', style: TextStyle(fontSize: 24)),
                width: 100,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 2,
                        color: Colors.blueAccent,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              SizedBox(width: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 225, 0)),
                  onPressed: () {
                    setState(() {
                      _promiseHours++;
                    });
                  },
                  child: Icon(Icons.add, size: 32, color: Colors.black)),
              SizedBox(width: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 11, 11, 11)),
                  onPressed: () {
                    setState(() {
                      if (_promiseHours > 0) _promiseHours--;
                    });
                  },
                  child: Icon(Icons.remove, size: 32, color: Colors.white))
            ],
          )
        ],
      ),
    );
  }
}
