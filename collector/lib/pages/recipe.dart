import 'dart:io';
import 'package:collector/colours.dart';
import 'package:collector/models/recipe_model.dart';
import 'package:collector/pages/edit_recipe.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class Recipe extends StatefulWidget {
  final RecipeModel recipe;

  const Recipe({
    super.key,
    required this.recipe
  });

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    // return ValueListenableBuilder(
    //   valueListenable: ValueNotifier<RecipeModel>(Hive.box<RecipeModel>("recipe_box").get(currentRecipe.key)!),
    //   builder: (context, recipe, _){
        return Scaffold(
          backgroundColor: Color(kLightMain),
          appBar: AppBar(
            title: Text(
              widget.recipe.title,
              style: TextStyle(
                fontFamily: 'Gorditas',
              ),
            ),
            backgroundColor: Color(kDarkMain),
            foregroundColor: Color(kOnDarkMain),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditRecipe(recipe: widget.recipe))).then((changed){
                    setState(() {});
                  });
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
                  ).then((delete){
                    if (delete!){
                      Hive.box<RecipeModel>("recipe_box").delete(widget.recipe.key);
                      if (context.mounted){
                        Navigator.pop(context);
                      }
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
                  child: widget.recipe.imagePath == '' ?
                  Image.asset('assets/images/default.jpg', fit: BoxFit.cover) :
                  Image.file(
                    File(widget.recipe.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Ingredients",
                style: TextStyle(
                        fontSize: 26,
                        color: Color(kBlack),
                        fontFamily: "Gorditas",
                      ),
              ),
              // List ingredients here
              Text(widget.recipe.ingredients),
        
              Text(
                "Steps",
                style: TextStyle(
                        fontSize: 26,
                        color: Color(kBlack),
                        fontFamily: "Gorditas",
                      ),
              ),
              // List steps here
              Text(widget.recipe.steps),
              
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => {
              Navigator.pop(context)
            },
            backgroundColor: Color(kDarkMain),
            shape: CircleBorder(),
            child: const Icon(Icons.home, color: Color(kOnDarkMain)),
          ),
        );
    //   },
    // );
  }
}
