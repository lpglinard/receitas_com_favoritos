import 'package:flutter/material.dart';
import 'features/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Ainda não foi realizado o processo de lógica entre telas, sendo assim,
      // para visualizar no emulador a tela desejada, selecione abaixo qual tela
      // deseja emular/abrir e deixe somente ela como linha de código não comentada,
      // enquanto mantêm as outras linhas comentadas.

      // ----- Página Splah ----- \\
      home: SplashPage(),

      // ---- Página de Login ----- \\
      // home: LoginPage(),

      // ---- Página home ----- \\
      // home: HomePage(),
    );
  }
}
