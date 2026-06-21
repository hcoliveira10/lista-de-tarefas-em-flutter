import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATIVIDADE ACQA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1E222B), // Fundo escuro azulado/ardósia
        primaryColor: const Color(0xFF00ADB5), // Ciano/Teal vibrante
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00ADB5),
          primary: const Color(0xFF00ADB5),
          secondary: const Color(0xFF393E46), // Cinza grafite escuro
        ),
        fontFamily: 'Roboto',
      ),
      home: const LoginPage(),
    );
  }
}