class Room {
  final String roomName;
  final String invitationCode;

  Room({required this.roomName, required this.invitationCode});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomName: json['roomName'],
      invitationCode: json['invitationCode'],
    );
  }
}
