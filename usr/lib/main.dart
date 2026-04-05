import 'package:flutter/material.dart';
import 'screens/landing_page.dart';

void main() {
  runApp(const FashionApp());
}

class FashionApp extends StatelessWidget {
  const FashionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vogue Fashion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
      },
    );
  }
}
