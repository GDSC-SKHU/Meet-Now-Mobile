import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              NavBarWidget(),
              Divider(thickness: 1.0, color: Colors.grey),
              PromiseList(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavBarWidget extends StatelessWidget {
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

class PromiseList extends StatefulWidget {
  @override
  State<PromiseList> createState() => _PromiseListState();
}

class _PromiseListState extends State<PromiseList> {
  List<String> items = ['Item1', 'Item2', 'Item3'];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: Container(child: Text(items[index])),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(thickness: 1);
        },
      ),
    );
  }
}
