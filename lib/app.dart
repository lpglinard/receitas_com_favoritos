import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prato_do_dia_app/pages/favorites/favorites_page.dart';
import 'package:prato_do_dia_app/pages/login/login_page.dart';
import 'package:prato_do_dia_app/pages/profile/profile_page.dart';
import 'package:prato_do_dia_app/pages/search/search_page.dart';
import 'pages/home/home_page.dart';
import 'pages/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      routes: {
        '/login': (context) => const Autenticador(),
        '/home': (context) => const HomePage(),
        '/pesquisar': (context) => const SearchPage(),
        '/favorites': (context) => const FavoritesPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

class Autenticador extends StatelessWidget {
  const Autenticador({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
