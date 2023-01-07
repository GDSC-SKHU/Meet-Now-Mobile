import 'package:flutter/material.dart';

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
