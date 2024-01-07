import 'package:app/pages/bots_page.dart';
import 'package:app/pages/bots_view_page.dart';
import 'package:app/pages/create_bot.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => HomePage(),
        '/bots': (context) => BotsPage(),
        '/bots_view': (context) => BotViewPage(),
        '/create': (context) => const CreatePage()
      },
    );
  }
}
