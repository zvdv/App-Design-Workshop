// import 'package:collector/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  //const RecipeCard({super.key});
  final String title;
  final String image;

  const RecipeCard({
    super.key,
    required this.title,
    required this.image
  });

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
              image,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: "Gorditas",
                ),
                textAlign: TextAlign.start,
                ),
            ),
          ],
        ),
      ),
    );
  }
}