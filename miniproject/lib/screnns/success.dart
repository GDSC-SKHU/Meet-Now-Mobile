import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:miniproject/screnns/login.dart';
import 'package:miniproject/color_schemes.g.dart';
import 'package:miniproject/screnns/result.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(colorScheme: lightColorScheme),
        home: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            const SizedBox(),
            Container(
              height: 400,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(4, 4)),
                ],
                color: Color.fromARGB(255, 255, 238, 90),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Image.asset(
                    '/Users/seohee/Desktop/mobile_study/Meet-Now-Mobile/miniproject/image/clap.png',
                    width: 80),
                Text(
                  '길동,민지,만남',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 30),
                Text('약속이 만들어졌어요', style: TextStyle(fontSize: 20)),
                SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('초대코드 : ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  Text('0110',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600))
                ]),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: (Text('시간등록')),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ResultScreen()));
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
