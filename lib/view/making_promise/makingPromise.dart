import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:meetnow/view/time_table/success.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MakingPromise extends StatefulWidget {
  @override
  State<MakingPromise> createState() => _MakingPromiseState();
}

class _MakingPromiseState extends State<MakingPromise> {
  var title = '';
  var promiseHours = 0;
  var startDate = '2023-00-00';
  var endDate = '2023-00-00';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: IconButton(
                  onPressed: () => {Navigator.pop(context)},
                  icon: Icon(Icons.arrow_back)),
              alignment: Alignment.centerLeft,
            ),
            TypePromiseName(),
            SettingPromiseHour(),
            SubmitButton(
              title: title,
              promiseHours: promiseHours,
              startDate: startDate,
              endDate: endDate,
            ),
          ],
        ),
      ),
    );
  }
}

class TypePromiseName extends StatefulWidget {
  @override
  State<TypePromiseName> createState() => _TypePromiseNameState();
}

class _TypePromiseNameState extends State<TypePromiseName> {
  final promiseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _MakingPromiseState? parent =
        context.findAncestorStateOfType<_MakingPromiseState>();
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextField(
        controller: promiseController,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          hintText: '약속 이름을 입력해 주세요.',
        ),
        onChanged: (value) {
          parent?.setState(() {
            parent.title = value;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    promiseController.dispose();
    super.dispose();
  }
}

class SettingPromiseHour extends StatefulWidget {
  @override
  State<SettingPromiseHour> createState() => _SettingPromiseHourState();
}

class _SettingPromiseHourState extends State<SettingPromiseHour> {
  @override
  Widget build(BuildContext context) {
    _MakingPromiseState? parent =
        context.findAncestorStateOfType<_MakingPromiseState>();
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 40, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  child: Text(
                    '${parent?.promiseHours}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
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
                      parent?.setState(() {
                        parent.promiseHours++;
                      });
                    },
                    child: Icon(Icons.add, size: 32, color: Colors.black)),
                SizedBox(width: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 11, 11, 11)),
                    onPressed: () {
                      parent?.setState(() {
                        if (parent.promiseHours > 1) parent.promiseHours--;
                      });
                    },
                    child: Icon(Icons.remove, size: 32, color: Colors.white))
              ],
            ),
            SizedBox(height: 50),
            Text(
              '약속 기간 (일주일)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SelectDateForm(text: parent?.startDate),
                SizedBox(width: 20),
                Text(
                  '~',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                SizedBox(width: 20),
                SelectDateForm(text: parent?.endDate),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));
                    if (pickedDate != null) {
                      parent?.setState(
                        () {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          String pickedEndDate = DateFormat('yyyy-MM-dd')
                              .format(pickedDate.add(Duration(days: 7)));
                          parent.startDate = formattedDate;
                          parent.endDate = pickedEndDate;
                        },
                      );
                    } else {}
                  },
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    size: 35,
                    color: Colors.yellow.shade700,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectDateForm extends StatefulWidget {
  final text;
  SelectDateForm({required this.text});

  @override
  State<SelectDateForm> createState() => _SelectDateFormState();
}

class _SelectDateFormState extends State<SelectDateForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: Text(
        widget.text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      width: 110,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 2, color: Colors.blueAccent, style: BorderStyle.solid),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final title;
  final promiseHours;
  final startDate;
  final endDate;
  var roomCode;
  SubmitButton({
    this.title,
    this.promiseHours,
    this.endDate,
    this.startDate,
  });

  Future<bool> postRoomData() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonData = {
      "roomName": title,
      "appointmentHour": promiseHours,
      "startDate": startDate,
      "endDate": endDate
    };
    var body = jsonEncode(jsonData);
    var response = await http.post(
      Uri.http("sungwoo1.duckdns.org", "/rooms"),
      body: body,
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
        'content-type': 'application/json',
        'charset': 'utf-8',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      roomCode = data['invitationCode'];
      print(data);
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
        child: ElevatedButton(
          child: Text(
            '약속 만들기',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.yellow),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: () async {
            if (title == '' ||
                promiseHours == 0 ||
                startDate == '2023-00-00' ||
                endDate == '2023-00-00') {
              showToast();
              return;
            }
            if (await postRoomData()) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  settings: RouteSettings(name: '/Success'),
                  builder: (context) =>
                      SuccessScreen(title: title, roomCode: roomCode),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

void showToast() {
  Fluttertoast.showToast(
    msg: "빈 항목이 있습니다. 모두 입력해 주세요.",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.redAccent,
    fontSize: 20,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
