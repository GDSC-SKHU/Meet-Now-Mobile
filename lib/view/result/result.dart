import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Image.asset('assets/images/clap.png', width: 100),
          Text('지금!만나!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
          SizedBox(height: 10),
          Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow,
              ),
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(children: [
                Text(
                  '1  ',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 55, 0),
                      fontWeight: FontWeight.w700),
                ),
                Text('1' + '월' + '10' + '일',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 20),
                Text('순위1',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500))
              ])),
          SizedBox(height: 10),
          Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow,
              ),
              child: Row(children: [
                Text(
                  '2  ',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 55, 0),
                      fontWeight: FontWeight.w700),
                ),
                Text('1' + '월' + '10' + '일',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 20),
                Text('순위2',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500))
              ])),
          SizedBox(height: 10),
          Container(
              width: 400,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow,
              ),
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(children: [
                Text(
                  '3  ',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 55, 0),
                      fontWeight: FontWeight.w700),
                ),
                Text('1' + '월' + '10' + '일',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 20),
                Text('순위3',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500))
              ])),
          SizedBox(height: 10),
          Container(
              width: 400,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow,
              ),
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(children: [
                Text(
                  '4  ',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 55, 0),
                      fontWeight: FontWeight.w700),
                ),
                Text('1' + '월' + '10' + '일',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 20),
                Text('순위4',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500))
              ])),
          SizedBox(height: 10),
          Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow,
              ),
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(children: [
                Text(
                  '5  ',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 55, 0),
                      fontWeight: FontWeight.w700),
                ),
                Text('1' + '월' + '10' + '일',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 20),
                Text('순위5',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500))
              ])),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 140,
                height: 50,
                child: ElevatedButton(
                  child: (Text('약속다시잡기')),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 133, 33)),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              SizedBox(
                width: 140,
                height: 50,
                child: OutlinedButton(
                  child: Text('닫기'),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/RoomListView');
                  },
                  style: OutlinedButton.styleFrom(),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
