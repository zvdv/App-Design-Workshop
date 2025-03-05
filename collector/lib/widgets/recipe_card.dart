// import 'package:collector/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  //const RecipeCard({super.key});
  final String title;
  final String image;

  const RecipeCard({
    super.key,
    required this.title,
    required this.image
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Navigate to recipe page"),
      onLongPress: () => print("Show title"),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              widget.image,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF000000), Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter)
              ),
            ),
            Positioned(
                bottom: 12,
                left: 16,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 30,
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