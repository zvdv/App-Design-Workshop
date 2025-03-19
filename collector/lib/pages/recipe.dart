import 'package:collector/models/recipe_model.dart';
import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  final RecipeModel recipe;

  const Recipe({
    super.key,
    required this.recipe
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4D9),
      appBar: AppBar(
        title: Text(
          recipe.title,
          style: TextStyle(
            fontFamily: 'Gorditas',
          ),
        ),
        backgroundColor: Color(0xFF7A4A0F),
        foregroundColor: Color(0xFFFFFAEC),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                recipe.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "Ingredients",
            style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontFamily: "Gorditas",
                  ),
          ),
          // List ingredients here
          Text(recipe.ingredients),

          Text(
            "Steps",
            style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontFamily: "Gorditas",
                  ),
          ),
          // List steps here
          Text(recipe.steps),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pop(context)
        },
        backgroundColor: Color(0xFF7A4A0F),
        shape: CircleBorder(),
        child: const Icon(Icons.home, color: Color(0xFFFFFAEC)),
      ),
    );
  }
}
