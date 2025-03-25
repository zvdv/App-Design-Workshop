import 'package:collector/colours.dart';
import 'package:collector/hive_registrar.g.dart';
import 'package:collector/models/recipe_model.dart';
import 'package:collector/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<RecipeModel>("recipe_box");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recipe Book",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(kDarkMain))
      ),
    );
  }
}

