import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Baris 1"),
        const SizedBox(height: 50),
        const Text("Baris 2"),
        const SizedBox(height: 16),
        SizedBox(
          width: 150,
          height: 25,
          child: ElevatedButton(
            onPressed: () {}, 
            child: const Text("Tombol"),
          ),
        ),
      ],
    );
  }
}