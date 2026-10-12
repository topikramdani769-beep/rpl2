import 'package:flutter/material.dart';

class ListViewBasic extends StatelessWidget {
  const ListViewBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Basic'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blue),
            title: const Text('Baris 1', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Keterangan baris 1'),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blue),
            title: const Text('Baris 2', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Keterangan baris 2'),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blue),
            title: const Text('Baris 3', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Keterangan baris 3'),
          ),
        ],
      ),
    );
  }
}