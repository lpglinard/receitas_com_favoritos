import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';
import 'pages/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Página Splah
      home: const SplashPage(),
      // Navegação para o menu principal
      routes: {
        '/home': (context) => const HomePage(),
      },

      // ---- Página de Login ----- \\
      // home: LoginPage(),

      // ---- Página home ----- \\
      // home: HomePage(),
    );
  }
}
