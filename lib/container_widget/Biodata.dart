import 'package:flutter/material.dart';

class Biodata extends StatelessWidget {
  const Biodata({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250, 
        height: 320,
        padding: const EdgeInsets.all(16),
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 80, 
              height: 80, 
              color: Colors.red,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama: Mohamad Topik Ramdani', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                Text('Kelas : XII RPL 2', style: TextStyle(color: Color.fromARGB(255, 5, 5, 5))),
                Text('Alamat: Bandung', style: TextStyle(color: Color.fromARGB(255, 27, 27, 27))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}