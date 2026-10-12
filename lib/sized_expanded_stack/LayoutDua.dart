import 'package:flutter/material.dart';

class LayoutDua extends StatelessWidget {
  const LayoutDua({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.image, size: 60, color: Colors.grey),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.all(8),
              // PERBAIKAN: color dipindah ke dalam BoxDecoration
              // atau jika tidak butuh border/radius, cukup hapus BoxDecoration-nya.
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4), // Opsional biar makin rapi
              ),
              child: Text(
                "-20%",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(bottom: 8, right: 8, child: Icon(Icons.favorite_border)),
        ],
      ),
    );
  }
}