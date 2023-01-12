import 'package:flutter/material.dart';

class Room {
  final String roomName;
  final String invitationCode;
  final String startDate;

  Room(
      {required this.roomName,
      required this.invitationCode,
      required this.startDate});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomName: json['roomName'],
      invitationCode: json['invitationCode'],
      startDate: json['startDate'],
    );
  }
}

class RoomInfo {
  final String roomName;
  final String startDate;
  final String invitationCode;
  final List<TimeTable> timeTableList;

  RoomInfo(
      {required this.roomName,
      required this.startDate,
      required this.invitationCode,
      required this.timeTableList});

  factory RoomInfo.fromJson(Map<String, dynamic> json) {
    List<TimeTable> timeTableList = (json['timeTableList'] as List)
        .map((i) => TimeTable.fromJson(i))
        .toList();
    return RoomInfo(
        roomName: json['roomName'],
        startDate: json['startDate'],
        invitationCode: json['invitationCode'],
        timeTableList: timeTableList);
  }
}

class TimeTable {
  final String username;
  final List<TimeList> timeList;

  TimeTable({required this.username, required this.timeList});

  factory TimeTable.fromJson(Map<String, dynamic> json) {
    List<TimeList> timeList =
        (json['timeList'] as List).map((i) => TimeList.fromJson(i)).toList();
    return TimeTable(username: json['username'], timeList: timeList);
  }
}

class TimeList {
  final String date;
  final String time;

  TimeList({required this.date, required this.time});

  factory TimeList.fromJson(Map<String, dynamic> json) {
    return TimeList(date: json['date'], time: json['time']);
  }
}

class PersonalRoom {
  final String roomName;
  final String startDate;
  final String invitationCode;
  final String username;
  final List<TimeList> timeList;

  PersonalRoom(
      {required this.roomName,
      required this.startDate,
      required this.invitationCode,
      required this.username,
      required this.timeList});

  factory PersonalRoom.fromJson(Map<String, dynamic> json) {
    List<TimeList> timeList =
        (json['timeList'] as List).map((i) => TimeList.fromJson(i)).toList();
    return PersonalRoom(
        roomName: json['roomName'],
        startDate: json['startDate'],
        invitationCode: json['invitationCode'],
        username: json['username'],
        timeList: timeList);
  }
}

final ColorMount = {
  "0": Colors.white,
  "1": Colors.amber.shade100,
  "2": Colors.amber.shade200,
  "3": Colors.amber.shade300,
  "4": Colors.amber.shade400,
  "5": Colors.amber.shade500,
  "6": Colors.amber.shade600,
};

final NumtoDate = {
  "0": "일",
  "1": "월",
  "2": "화",
  "3": "수",
  "4": "목",
  "5": "금",
  "6": "토",
};
