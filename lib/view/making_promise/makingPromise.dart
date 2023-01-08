import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      padding: EdgeInsets.fromLTRB(16, 50, 0, 0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '몇 시간 짜리 약속인가요?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 12),
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
          ),
          SizedBox(height: 50),
          Text(
            '약속 기간 (최대 일주일)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SelectDateForm(),
              SizedBox(width: 20),
              Text(
                '~',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(width: 20),
              SelectDateForm(),
            ],
          )
        ],
      ),
    );
  }
}

const List<String> category_map = [
  "1월",
  "2월",
  "3월",
];

class SelectDateForm extends StatefulWidget {
  @override
  State<SelectDateForm> createState() => _SelectDateFormState();
}

class _SelectDateFormState extends State<SelectDateForm> {
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: TextField(
        textAlign: TextAlign.center,
        controller: dateInput,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          hintText: 'YYYY-MM-DD',
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2100));
          if (pickedDate != null) {
            print(
                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            print(
                formattedDate); //formatted date output using intl package =>  2021-03-16
            setState(() {
              dateInput.text =
                  formattedDate; //set output date to TextField value.
            });
          } else {}
        },
      ),
    );
  }
}
