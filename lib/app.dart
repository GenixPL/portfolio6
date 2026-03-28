import 'package:flutter/material.dart';
import 'package:portfolio6/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: .dark(
          primary: Colors.amber,
          secondary: Colors.redAccent,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
