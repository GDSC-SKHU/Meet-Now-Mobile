import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meetnow/view/time_table/success.dart';

class MakingPromise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            child: IconButton(
                onPressed: () => {Navigator.pop(context)},
                icon: Icon(Icons.arrow_back)),
            alignment: Alignment.centerLeft,
          ),
          TypePromiseName(),
          SettingPromiseHour(),
          SubmitButton(),
        ]),
      ),
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

class SettingPromiseHour extends StatefulWidget {
  @override
  State<SettingPromiseHour> createState() => _SettingPromiseHourState();
}

class _SettingPromiseHourState extends State<SettingPromiseHour> {
  int _promiseHours = 1;
  String startDate = "2023-00-00";
  String endDate = "2023-00-00";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 40, 0, 0),
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
                  child: Text(
                    '${_promiseHours}',
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
                        if (_promiseHours > 1) _promiseHours--;
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
                SelectDateForm(text: startDate),
                SizedBox(width: 20),
                Text(
                  '~',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                SizedBox(width: 20),
                SelectDateForm(text: endDate),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      String pickedEndDate = DateFormat('yyyy-MM-dd')
                          .format(pickedDate.add(Duration(days: 7)));
                      setState(
                        () {
                          startDate = formattedDate;
                          endDate = pickedEndDate;
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
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 90,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
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
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                settings: RouteSettings(name: 'Success'),
                builder: (context) => SuccessScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
