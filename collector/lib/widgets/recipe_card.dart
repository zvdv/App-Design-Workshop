// import 'package:collector/models/recipe_model.dart';
import 'package:collector/models/recipe_model.dart';
import 'package:collector/pages/recipe.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  //const RecipeCard({super.key});
  // final String title;
  // final String image;
  final RecipeModel recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool showTitle = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (context) => Recipe(recipe: widget.recipe))
        )
      },
      onTapDown: (l) => setState(() {
        showTitle = true;
      }),
      onTapUp: (l) => setState(() {
        showTitle = false;
      }),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              widget.recipe.imagePath,
              fit: BoxFit.cover,
            ),
            if (showTitle)
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF000000), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            if (showTitle)
              Positioned(
                bottom: 12,
                left: 16,
                child: Text(
                  widget.recipe.title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "Gorditas",
                  ),
                  //textAlign: TextAlign.start,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
