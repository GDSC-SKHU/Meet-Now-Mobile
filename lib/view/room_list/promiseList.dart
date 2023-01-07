import 'package:flutter/material.dart';

class PromiseList extends StatefulWidget {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
    'Item9',
  ];
  @override
  State<PromiseList> createState() => _PromiseListState();
}

class _PromiseListState extends State<PromiseList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: Container(child: Text(widget.items[index])),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(thickness: 1);
        },
      ),
    );
  }
}
