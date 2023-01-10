import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  final title;
  TimeTable({required this.title});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  var toggleIcon = Icons.sunny;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      toggleIcon == Icons.sunny
                          ? toggleIcon = Icons.nightlight
                          : toggleIcon = Icons.sunny;
                      print(toggleIcon);
                    });
                  },
                  icon: Icon(
                    toggleIcon,
                    size: 35,
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
            Table(),
          ],
        ),
      ),
    );
  }
}

class Table extends StatelessWidget {
  final dayList = ['🗓️', '일', '월', '화', '수', '목', '금', '토'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: dayList
              .map(
                (e) => Container(
                  child: Text(
                    e,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 10),
        for (num i = 1; i < 12; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (num j = 0; j < 8; j++)
                SizedBox(
                  width: MediaQuery.of(context).size.width / 8,
                  height: MediaQuery.of(context).size.width / 8,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(""),
                  ),
                )
            ],
          )
      ],
    );
  }
}

class Week extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
