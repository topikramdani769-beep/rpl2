import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Portofolio RPL',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      // home: const HomePage(), // <-- Hapus baris home ini
      
      // Karena AppRoutes.routes sudah memiliki rute '/' (home), 
      // Flutter akan otomatis membukanya sebagai halaman awal!
      routes: AppRoutes.routes,
    );
  }
}
