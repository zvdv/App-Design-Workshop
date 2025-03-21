import 'package:collector/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              showDialog<bool>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Are you sure you want to delete this recipe?'),
                  content: const Text('This action cannot be undone.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ).then((value){
                print(value);
                Hive.box<RecipeModel>("recipe_box").delete(recipe.key);
                if (context.mounted){
                  Navigator.pop(context);
                }
              });
            },
            icon: Icon(Icons.delete),
          )
        ],
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
