import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/about_page.dart';
import '../grid_view_flutter/grid_screen.dart';
import '../latihan/LatihanFeedig.dart';
import '../pages/formulir_page.dart';
import '../pages/output_page.dart';
import '../pages/input_page.dart';
import '../pages/eco_list_page.dart';
import '../pages/albumpage.dart';

class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String latihanfeed = '/latihanfeed';
  static const String grid = '/grid';
  static const String formulir = '/formulir'; // Disesuaikan agar sinkron
  static const String input = '/input';       // Disesuaikan agar sinkron
  static const String output = '/output';
  static const String ecoList = '/eco_list';
  static const String album = '/album';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    about: (context) => const AboutPage(),
    latihanfeed: (context) => const FeedScreen(),
    grid: (context) => const GridProductPage(),
    formulir: (context) => const FormulirPage(),
    input: (context) => const BelajarForm(), // Diaktifkan kembali (tidak dikomentari)
    output: (context) => const OutputFormScreen(  // Diaktifkan kembali
      nama: '',
      jk: '',
      tglLahir: '',
      agama: '',
    ),
    ecoList: (context) => const EcoListScreen(),
    album: (context) => const Albumpage(),
  };
}