import 'package:flutter/material.dart';
import 'package:meetnow/view/result/result.dart';

class MergeTable extends StatefulWidget {
  final title;
  MergeTable({required this.title});

  @override
  State<MergeTable> createState() => _MergeTableState();
}

class _MergeTableState extends State<MergeTable> {
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
            Table(iconState: toggleIcon == Icons.sunny ? "🌞" : "🌚"),
            Grid(),
            SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class Table extends StatefulWidget {
  final iconState;
  Table({required this.iconState});

  @override
  State<Table> createState() => _TableState();
}

class _TableState extends State<Table> {
  final dayList = ['', '일', '월', '화', '수', '목', '금', '토'];

  @override
  Widget build(BuildContext context) {
    dayList[0] = widget.iconState;
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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: DayList),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class Grid extends StatefulWidget {
  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  var tableState =
      List.generate(8, (index) => List.filled(12, false, growable: false));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
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
                                  tableState[j][i] == true
                                      ? tableState[j][i] = false
                                      : tableState[j][i] = true;
                                });
                              },
                              child: Text(""),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                backgroundColor: tableState[j][i] == false
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
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Container(
            width: 200,
            height: 60,
            padding: EdgeInsets.fromLTRB(32, 0, 0, 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '시간 변경',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
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
          Spacer(),
          Container(
            width: 200,
            height: 60,
            padding: EdgeInsets.fromLTRB(0, 0, 32, 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: RouteSettings(name: '/Result'),
                    builder: (context) => ResultScreen(),
                  ),
                );
              },
              child: Text(
                '결과 보기',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }
}
