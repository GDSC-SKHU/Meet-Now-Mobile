import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(
          Icons.search,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }
}
