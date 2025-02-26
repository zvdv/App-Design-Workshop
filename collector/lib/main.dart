import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Recipes",
            ),
          backgroundColor: Color(0xFF7A4A0F),
          foregroundColor: Color(0xFFFFFAEC),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
