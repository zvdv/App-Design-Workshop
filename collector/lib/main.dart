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
          surfaceTintColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(26, 12, 26, 0),
              child: SearchBar(
                backgroundColor: WidgetStatePropertyAll(Color(0xFFFFFFFF)),
                elevation: WidgetStatePropertyAll(3.0),
                hintText: "Search recipes...",
                hintStyle: WidgetStatePropertyAll(TextStyle(
                  color: Color(0xFFE2D9C4),
                )),
                overlayColor: WidgetStatePropertyAll(Color(0xFFFFFFFF)),
                textStyle: WidgetStatePropertyAll(TextStyle(
                  color: Color(0xFFE2D9C4),
                )),
                leading: Icon(
                  Icons.search,
                  color: Color(0xFFE2D9C4),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(12, (index) {
                  return Center(
                    child: Text(
                      'Item $index',
                    ),
                  );
                }),
              ),
            )
          ],
        ),
        backgroundColor: Color(0xFFFFF4D9),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
