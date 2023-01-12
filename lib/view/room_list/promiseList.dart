import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meetnow/model/Room.dart';
import 'package:meetnow/view/time_table/mergeTable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PromiseList extends StatefulWidget {
  @override
  State<PromiseList> createState() => _PromiseListState();
}

class _PromiseListState extends State<PromiseList> {
  List<Room> items = [];
  Future<void> getListData() async {
    final prefs = await SharedPreferences.getInstance();

    var response = await http.get(
      Uri.http("35.230.73.173", "/rooms"),
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
        'content-type': 'application/json',
        'charset': 'utf-8',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> rooms = data['rooms'];

      setState(() {
        items = rooms.map((e) => Room.fromJson(e)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getListData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  settings: RouteSettings(name: '/MergeTable'),
                  builder: (context) => MergeTable(
                    title: items[index].roomName,
                    roomCode: items[index].invitationCode,
                    startDate: items[index].startDate,
                  ),
                ),
              );
            },
            title: Row(
              children: [
                Text(items[index].roomName, style: TextStyle(fontSize: 16)),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            '방 코드는 ${items[index].invitationCode}입니다.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(thickness: 1);
        },
      ),
    );
  }
}
