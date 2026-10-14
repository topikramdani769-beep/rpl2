import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/about_page.dart';
import '../grid_view_flutter/grid_screen.dart';
import '../latihan/LatihanFeedig.dart';
import '../pages/formulir_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String latihanfeed = '/latihanfeed';
  static const String grid = '/grid';
  static const String formulir = '/formulir_page';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    about: (context) => const AboutPage(),
    latihanfeed: (context) => const FeedScreen(),
    grid: (context) => const GridProductPage(),
    formulir: (context) => FormulirPage(),
  };
}
