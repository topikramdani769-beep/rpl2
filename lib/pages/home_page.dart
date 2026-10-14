import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Halaman Home"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.about); 
              },
              child: const Text('Pergi ke Halaman About'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.latihanfeed);
              },
              child: const Text('Pergi ke Halaman Latihan Feed'),
            ),
            const SizedBox(height: 10),
            const Text("Halaman Instagram"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.grid);
              },
              child: const Text('Pergi ke Halaman Instagram'),
            ),
            const SizedBox(height: 10),
            const Text("Halaman Form"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.formulir);
              },
              child: const Text('Pergi ke Halaman Formulir'),
            ),
          ],
        ),
      ),
    );
  }
}