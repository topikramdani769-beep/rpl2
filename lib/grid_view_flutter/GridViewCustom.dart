import 'package:flutter/material.dart';

class GridViewCustomPage extends StatelessWidget {
  const GridViewCustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView.custom')),
      body: GridView.custom(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              color: Colors.purple[100 * ((index % 8) + 1)],
              child: Center(child: Text('Custom ${index + 1}')),
            );
          },
          childCount: 6,
        ),
      ),
    );
  }
}