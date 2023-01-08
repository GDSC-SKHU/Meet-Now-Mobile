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
            SubmitButton(),
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
    return Expanded(
      child: Container(
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
                SelectDateForm(placeholder: '처음 날짜'),
                SizedBox(width: 20),
                Text(
                  '~',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                SizedBox(width: 20),
                SelectDateForm(placeholder: '마지막 날짜'),
                SizedBox(width: 20),
                Icon(
                  Icons.calendar_month_outlined,
                  size: 45,
                  color: Colors.yellow.shade700,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectDateForm extends StatefulWidget {
  final placeholder;
  SelectDateForm({required this.placeholder});

  @override
  State<SelectDateForm> createState() => _SelectDateFormState();
}

class _SelectDateFormState extends State<SelectDateForm> {
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: TextField(
        textAlign: TextAlign.center,
        controller: dateInput,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          hintText: '${widget.placeholder}',
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2100));
          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            setState(() {
              dateInput.text = formattedDate;
            });
          } else {}
        },
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
          onPressed: () {},
        ),
      ),
    );
  }
}
