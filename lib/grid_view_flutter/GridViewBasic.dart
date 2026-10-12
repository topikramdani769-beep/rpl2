import 'package:flutter/material.dart';

class GridViewCountPage extends StatelessWidget {
  const GridViewCountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView.count')),
      body: GridView.count(
        crossAxisCount: 2, // 2 kolom ke samping
        padding: const EdgeInsets.all(12),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(6, (index) {
          return Container(
            color: Colors.blue[100 * ((index % 8) + 1)],
            child: Center(child: Text('Kotak ${index + 1}')),
          );
        }),
      ),
    );
  }
}