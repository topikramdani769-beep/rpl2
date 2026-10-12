import 'package:flutter/material.dart';

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView.custom')),
        body: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                title: Text('Custom Item ke-${index + 1}'),
              );
            },
            childCount: 5,
          ),
        ),
      ),
    );
  }
}