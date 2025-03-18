import 'package:dashboard/home.dart';
import 'package:dashboard/select_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // Wrap MaterialApp with ChangeNotifierProvider so that changes to the SelectProvider are accessible to all the pages
      create: (context) => SelectProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Hide Debug banner
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF849F09)) // Default colours will be set based on this colour seed
        ),
        home: Home(), // Set landing page
      )
    );
  }
}