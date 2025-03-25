import 'package:collector/colours.dart';
import 'package:collector/models/recipe_model.dart';
import 'package:collector/pages/add_recipe.dart';
import 'package:collector/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kLightMain),
      appBar: AppBar(
        title: Text(
          "Recipes",
          style: TextStyle(
            fontFamily: 'Gorditas',
          ),
        ),
        backgroundColor: Color(kDarkMain),
        foregroundColor: Color(kOnDarkMain),
        elevation: 6.0,
        shadowColor: Color(kBlack),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.fromLTRB(26, 12, 26, 0),
            child: SearchBar(
              backgroundColor: WidgetStatePropertyAll(Color(kWhite)),
              elevation: WidgetStatePropertyAll(3.0),
              hintText: "Search recipes...",
              hintStyle: WidgetStatePropertyAll(TextStyle(
                color: Color(kHintOnWhite),
              )),
              overlayColor: WidgetStatePropertyAll(Color(kWhite)),
              textStyle: WidgetStatePropertyAll(TextStyle(
                color: Color(kDarkMain),
              )),
              leading: Icon(
                Icons.search,
                color: Color(kHintOnWhite),
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
        backgroundColor: Color(kDarkMain),
        shape: CircleBorder(),
        child: const Icon(Icons.add, color: Color(kOnDarkMain)),
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
      child: ValueListenableBuilder(
        valueListenable: Hive.box<RecipeModel>("recipe_box").listenable(),
        builder: (context, box, _){
          final recipes = box.values.toList();
          if (recipes.isEmpty){
            return Center(
              child: Text(
                'Add your first recipe with the + button!',
                style: TextStyle(
                  color: Color(kDarkMain)
                )
              )
            );
          }
      
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: recipes.length,
            itemBuilder: (context, index){
              return RecipeCard(recipe: recipes[index]);
            },
            padding: EdgeInsets.all(8.0),
          );
        }
      ),
    );
  }
}