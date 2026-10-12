import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView.separated')),
        body: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Data ke-${index + 1}'),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(color: Colors.red, thickness: 1);
          },
        ),
      ),
    );
  }
}