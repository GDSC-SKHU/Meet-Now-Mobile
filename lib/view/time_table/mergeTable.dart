import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meetnow/model/Room.dart';
import 'package:meetnow/view/time_table/timeTable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MergeTable extends StatefulWidget {
  final title;
  final roomCode;
  final startDate;
  MergeTable(
      {required this.title, required this.roomCode, required this.startDate});

  @override
  State<MergeTable> createState() => _MergeTableState();
}

class _MergeTableState extends State<MergeTable> {
  var toggleIcon = Icons.sunny;

  List<List<TimeTableModel>> timeTables = [[]];
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
                  "${widget.title} 결과",
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
            Grid(
                iconState: toggleIcon == Icons.sunny ? "🌞" : "🌚",
                roomCode: widget.roomCode,
                timeTables: timeTables,
                ampm: toggleIcon == Icons.sunny ? true : false,
                startDate: widget.startDate),
            SubmitButton(title: widget.title, timeTables: timeTables),
          ],
        ),
      ),
    );
  }
}

class Grid extends StatefulWidget {
  final iconState;
  final roomCode;
  final timeTables;
  bool ampm;
  final startDate;
  Grid({
    required this.iconState,
    required this.roomCode,
    required this.timeTables,
    required this.ampm,
    required this.startDate,
  });

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  final dayList = ['', "", '월', '화', '수', '목', '금', '토'];
  var startDate = "";
  var tableStateAM =
      List.generate(8, (index) => List.filled(12, 0, growable: false));
  var tableStatePM =
      List.generate(8, (index) => List.filled(12, 0, growable: false));

  @override
  void initState() {
    super.initState();
    getTimeTables(widget.roomCode);
  }

  Future<bool> getTimeTables(roomCode) async {
    final prefs = await SharedPreferences.getInstance();

    var response = await http.get(
      Uri.http("35.230.73.173", "/timetables/rooms/${roomCode}"),
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
        'content-type': 'application/json',
        'charset': 'utf-8',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      RoomInfo room = RoomInfo.fromJson(json.decode(response.body));
      List<List<int>> am =
          List.generate(8, (index) => List.filled(12, 0, growable: false));
      List<List<int>> pm =
          List.generate(8, (index) => List.filled(12, 0, growable: false));
      // 유저별 반복
      for (var i in room.timeTableList) {
        for (var j in i.timeList) {
          if (int.parse(j.time) < 13) {
            am[int.parse(j.date)][int.parse(j.time)] += 1;
          } else {
            pm[int.parse(j.date)][int.parse(j.time) - 12] += 1;
          }
        }
      }

      setState(() {
        tableStateAM = am;
        tableStatePM = pm;
        startDate = room.startDate;
        print("aaaa$tableStateAM");
        print("변환 됨");
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    dayList[0] = widget.iconState;
    dayList[1] = widget.startDate;

    String day = widget.startDate;

    if (widget.startDate.toString().length != 1) {
      DateTime date = DateTime.parse(widget.startDate);
      day = date.weekday.toString();
    }
    for (int i = 0; i < 7; i++) {
      dayList[i + 1] = NumtoDate[((int.parse(day) + i) % 7).toString()]!;
    }
    List<Widget> DayList = dayList
        .map(
          (e) => Container(
            child: Text(
              e,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        )
        .toList();
    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: DayList),
                ),
                SizedBox(height: 10),
              ],
            ),
            for (int i = 0; i < 12; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int j = 0; j < 8; j++)
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 10) / 8,
                      height: (MediaQuery.of(context).size.width - 10) / 8,
                      child: j == 0
                          ? Text(
                              "${i.toString()}시",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 3),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: widget.ampm == true
                                    ? ColorMount[tableStateAM[j][i].toString()]
                                    : ColorMount[tableStatePM[j][i].toString()],
                                border:
                                    Border.all(width: 1, color: Colors.black54),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                            ),
                    ),
                  SizedBox(width: 10),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final timeTables;
  final title;
  SubmitButton({required this.timeTables, required this.title});
  @override
  Widget build(BuildContext context) {
    _MergeTableState? parent =
        context.findAncestorStateOfType<_MergeTableState>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                settings: RouteSettings(name: '/TimeTable'),
                builder: (context) => TimeTableScreen(
                  title: title,
                  roomCode: parent?.widget.roomCode,
                  startDate: parent?.widget.startDate,
                ),
              ),
            );
          },
          child: Text(
            '시간 변경',
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
        ),
      ),
    );
  }
}
