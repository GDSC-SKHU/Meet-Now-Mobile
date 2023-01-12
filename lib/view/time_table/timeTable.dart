import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meetnow/model/Room.dart';
import 'package:meetnow/view/time_table/mergeTable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TimeTableScreen extends StatefulWidget {
  final title;
  final roomCode;
  final startDate;
  TimeTableScreen(
      {required this.title, required this.roomCode, required this.startDate});

  @override
  State<TimeTableScreen> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTableScreen> {
  var toggleIcon = Icons.sunny;
  var tableStateAM =
      List.generate(8, (index) => List.filled(12, false, growable: false));
  var tableStatePM =
      List.generate(8, (index) => List.filled(12, false, growable: false));
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
            Grid(
              iconState: toggleIcon == Icons.sunny ? "🌞" : "🌚",
              roomCode: widget.roomCode,
              parentAM: tableStateAM,
              parentPM: tableStatePM,
              startDate: widget.startDate,
            ),
            SubmitButton(
              title: widget.title,
              roomCode: widget.roomCode,
            ),
          ],
        ),
      ),
    );
  }
}

class Grid extends StatefulWidget {
  final iconState;
  var parentAM =
      List.generate(8, (index) => List.filled(12, false, growable: false));
  var parentPM =
      List.generate(8, (index) => List.filled(12, false, growable: false));
  final roomCode;
  final startDate;
  Grid({
    required this.iconState,
    required this.roomCode,
    required this.parentAM,
    required this.parentPM,
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
      Uri.http("35.230.73.173", "/timetables/room/${roomCode}"),
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
        'content-type': 'application/json',
        'charset': 'utf-8',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      PersonalRoom room = PersonalRoom.fromJson(json.decode(response.body));
      List<List<int>> am =
          List.generate(8, (index) => List.filled(12, 0, growable: false));
      List<List<int>> pm =
          List.generate(8, (index) => List.filled(12, 0, growable: false));
      // 유저별 반복
      for (var j in room.timeList) {
        if (int.parse(j.time) < 13) {
          am[int.parse(j.date)][int.parse(j.time)]++;
        } else {
          pm[int.parse(j.date)][int.parse(j.time) - 12]++;
        }
      }

      setState(() {
        tableStateAM = am;
        tableStatePM = pm;
        startDate = room.startDate;
        widget.parentAM = tableStateAM
            .map((e) => e.map((f) => f > 0 ? true : false).toList())
            .toList();
        widget.parentPM = tableStatePM
            .map((e) => e.map((f) => f > 0 ? true : false).toList())
            .toList();

        print(tableStateAM);
        print("변환 됨123");
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    dayList[0] = widget.iconState;
    dayList[1] = widget.startDate;
    for (int i = 0; i < 7; i++) {
      dayList[i + 1] =
          NumtoDate[((int.parse(widget.startDate) + i) % 7).toString()]!;
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

    _TimeTableState? parent =
        context.findAncestorStateOfType<_TimeTableState>();

    void setStateWhenClick(i, j) {
      setState(() {
        if (parent?.toggleIcon == Icons.sunny) {
          widget.parentAM[j][i] == true
              ? widget.parentAM[j][i] = false
              : widget.parentAM[j][i] = true;
        } else {
          widget.parentPM[j][i] == true
              ? widget.parentPM[j][i] = false
              : widget.parentPM[j][i] = true;
        }
      });
      parent?.setState(() {
        parent.tableStateAM = widget.parentAM;
        parent.tableStatePM = widget.parentPM;
      });
    }

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
                          : ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  setStateWhenClick(i, j);
                                });
                              },
                              child: Text(""),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                backgroundColor:
                                    parent?.toggleIcon == Icons.sunny
                                        ? widget.parentAM[j][i] == false
                                            ? Colors.white
                                            : Colors.amber
                                        : widget.parentPM[j][i] == false
                                            ? Colors.white
                                            : Colors.amber,
                                shadowColor: Colors.white,
                                elevation: 0,
                                side: BorderSide(
                                  color: Colors.black54,
                                  width: 1,
                                ),
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
  final title;
  final roomCode;
  SubmitButton({required this.title, required this.roomCode});
  @override
  Widget build(BuildContext context) {
    _TimeTableState? parent =
        context.findAncestorStateOfType<_TimeTableState>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
        child: ElevatedButton(
          onPressed: () {
            postTimeTable(roomCode, parent!.tableStateAM, parent.tableStatePM,
                ['0', '1', '2', '3', '4', '5', '6']).then(
              (value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  settings: RouteSettings(name: '/MergeTable'),
                  builder: (context) => MergeTable(
                    title: title,
                    roomCode: roomCode,
                    startDate: parent.widget.startDate,
                  ),
                ),
              ),
            );
          },
          child: Text(
            '완료',
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

class TimeTableModel {
  final String date;
  final String time;

  TimeTableModel({required this.date, required this.time});

  factory TimeTableModel.fromJson(Map<String, dynamic> json) {
    return TimeTableModel(
      date: json['roomName'],
      time: json['invitationCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'time': time,
    };
  }
}

Future<bool> postTimeTable(roomCode, List<List<bool>> timeTableAM, timeTablePM,
    List<String> date) async {
  List<TimeTableModel> data = [];
  for (var i = 0; i < timeTableAM.length; i++) {
    for (var j = 0; j < timeTableAM[0].length; j++) {
      if (timeTableAM[i][j] == true) {
        data.add(TimeTableModel(date: date[i], time: j.toString()));
      }
    }
  }
  for (var i = 0; i < timeTablePM.length; i++) {
    for (var j = 0; j < timeTablePM[0].length; j++) {
      if (timeTablePM[i][j] == true) {
        data.add(TimeTableModel(date: date[i], time: (j + 12).toString()));
      }
    }
  }

  final prefs = await SharedPreferences.getInstance();
  var body = json.encode(data);
  var response = await http.put(
    Uri.http("35.230.73.173", "/timetables/rooms/${roomCode}"),
    headers: {
      'Authorization': 'Bearer ${prefs.getString('token')}',
      'content-type': 'application/json',
      'charset': 'utf-8',
    },
    body: body,
  );

  if (response.statusCode == 204) {
    return true;
  } else {
    print(utf8.decode(response.bodyBytes));
    return false;
  }
}
