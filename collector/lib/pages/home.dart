import 'package:collector/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          RecipeGrid()
        ],
      ),
      backgroundColor: Color(0xFFFFF4D9),
    );
  }
}

class RecipeGrid extends StatelessWidget {
  const RecipeGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          RecipeCard(
            image: "assets/images/ema-datsi.jpg",
            title: "Ema Datsi",
          )
        ]
      ),
    );
  }
}
