import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:miniproject/screnns/login.dart';
import 'package:miniproject/color_schemes.g.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(colorScheme: lightColorScheme),
        home: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            const SizedBox(),
            Container(
              height: 600,
              width: 300,
              alignment: Alignment.center,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Image.asset(
                    '/Users/seohee/Desktop/mobile_study/Meet-Now-Mobile/miniproject/image/clap.png',
                    width: 80),
                Text('지금!만나!',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 10),
                SizedBox(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        color: Colors.yellow,
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
                        ]))),
                SizedBox(height: 10),
                SizedBox(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        color: Colors.yellow,
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
                        ]))),
                SizedBox(height: 10),
                SizedBox(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        color: Colors.yellow,
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
                        ]))),
                SizedBox(height: 10),
                SizedBox(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        color: Colors.yellow,
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
                        ]))),
                SizedBox(height: 10),
                SizedBox(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        color: Colors.yellow,
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
                        ]))),
                SizedBox(height: 10),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: (Text('약속다시잡기')),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(120, 40)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    OutlinedButton(
                      child: Text('닫기'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      style:
                          OutlinedButton.styleFrom(minimumSize: Size(120, 40)),
                    )
                  ],
                )
              ]),
            ),
          ]),
        ));
  }
}
