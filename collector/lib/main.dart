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
            style: TextStyle(
              fontFamily: 'Gorditas',
            ),
            ),
          backgroundColor: Color(0xFF7A4A0F),
          foregroundColor: Color(0xFFFFFAEC),
          elevation: 6.0,
          shadowColor: Color(0x00000000),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SearchBar(
                backgroundColor: WidgetStateProperty.all(Color(0xFFFFFFFF)),
                elevation: WidgetStateProperty.all(3.0),
                hintText: "Search recipes...",
                hintStyle: WidgetStateProperty.all(TextStyle(
                  color: Color(0xFFE2D9C4),
                )),
                leading: Icon(
                  Icons.search,
                  color: Color(0xFFE2D9C4),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFFFFF4D9),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
