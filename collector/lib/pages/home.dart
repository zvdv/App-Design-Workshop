import 'package:collector/models/recipe_model.dart';
import 'package:collector/pages/add_recipe.dart';
import 'package:collector/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4D9),
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
        automaticallyImplyLeading: false,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => const AddRecipe())
          )
        },
        backgroundColor: Color(0xFF7A4A0F),
        shape: CircleBorder(),
        child: const Icon(Icons.add, color: Color(0xFFFFFAEC)),
      ),
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
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          padding: EdgeInsets.all(8.0),
          children: getRecipes(),
          // [
          //   RecipeCard(
          //     image: 'assets/images/ema-datsi.jpg',
          //     title: "Ema Datsi",
          //   ),
          //   RecipeCard(
          //     image: 'assets/images/friedrice.jpg',
          //     title: "Fried Rice"
          //   ),
          //   RecipeCard(
          //     image: 'assets/images/momo.jpeg',
          //     title: "Momo"
          //   ),
          //   RecipeCard(
          //     image: 'assets/images/pizza.jpg',
          //     title: "Pizza"
          //   ),
          //   RecipeCard(
          //     image: 'assets/images/puta.jpg',
          //     title: "Puta"
          //   ),
          //   RecipeCard(
          //     image: 'assets/images/thukpa.jpg',
          //     title: "Thukpa"
          //   ),
          // ]
        ),
    );
  }
}

List<RecipeCard> getRecipes(){
  Iterable<RecipeModel> recipes = Hive.box<RecipeModel>("recipe_box").values;
  List<RecipeCard> recipeCards = [];

  for (RecipeModel recipe in recipes){
    recipeCards.add(RecipeCard(
      recipe: recipe,
    ));
  }

  return recipeCards;
}