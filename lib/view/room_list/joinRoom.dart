import 'package:flutter/material.dart';

class PopupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Widget'),
      ),
      body: Center(
        child: PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Text('Option 1'),
            ),
            PopupMenuItem(
              value: 2,
              child: Text('Option 2'),
            ),
          ],
          onSelected: (value) {
            print('Selected Value: $value');
          },
        ),
      ),
    );
  }
}
