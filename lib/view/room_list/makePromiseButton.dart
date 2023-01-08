import 'package:flutter/material.dart';
import 'package:meetnow/view/making_promise/makingPromise.dart';

class MakePromiseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 30, 15),
      child: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          child: Icon(Icons.add, size: 32),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MakingPromise()),
            );
          },
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
