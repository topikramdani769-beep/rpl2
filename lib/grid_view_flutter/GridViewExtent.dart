import 'package:flutter/material.dart';

class GridViewextentPage extends StatelessWidget {
  const GridViewextentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView.extent')),
      body: GridView.extent(
        maxCrossAxisExtent: 150.0, // Lebar maksimal setiap item 150 pixel
        padding: const EdgeInsets.all(12),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(8, (index) {
          return Container(
            color: Colors.orange[100 * ((index % 8) + 1)],
            child: Center(child: Text('Extent ${index + 1}')),
          );
        }),
      ),
    );
  }
}