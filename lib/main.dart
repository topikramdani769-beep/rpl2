import 'package:flutter/material.dart';

import 'pages/article_list_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'routes/app_routes.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await AuthService().getToken();
  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Portofolio RPL',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: isLoggedIn ? '/' : '/login',
      routes: {
        ...AppRoutes.routes,
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/articles': (context) => const ArticleListPage(),
      },
    );
  }
}