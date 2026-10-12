import 'package:flutter/material.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView.builder')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 20, // Total item data
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 kolom
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.green[100 * ((index % 8) + 1)],
            child: Center(child: Text('Item ke-${index + 1}')),
          );
        },
      ),
    );
  }
}