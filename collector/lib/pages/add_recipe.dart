import 'dart:io';
import 'package:collector/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:image_field/image_field.dart';
import 'package:path_provider/path_provider.dart';

class AddRecipe extends StatelessWidget {
  const AddRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4D9),
      appBar: AppBar(
        title: Text(
          "Add a Recipe",
          style: TextStyle(
            fontFamily: 'Gorditas',
          ),
        ),
        backgroundColor: Color(0xFF7A4A0F),
        foregroundColor: Color(0xFFFFFAEC),
        automaticallyImplyLeading: false,
      ),
      body: RecipeForm()
    );
  }
}

class RecipeForm extends StatefulWidget {
  const RecipeForm({super.key});

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final _formKey = GlobalKey<FormState>();
  RecipeModel recipe = RecipeModel(title: '', imagePath: '', ingredients: '', steps: '');
  dynamic imagefile;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Title Field
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24)
                  )
                ),
                onSaved: (value) => recipe.title = value!,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            // Image Field
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Add image', style: TextStyle(color: Color(0xFF7A4A0F))),
                  SizedBox(width: 20,),
                  SizedBox(
                    width: 200,
                    child: ImageField(
                      multipleUpload: false,
                      enabledCaption: false,
                      cardinality: 1,
                      onSave:(List<ImageAndCaptionModel>? images) async {
                        // TODO : handle if no image is picked
                        imagefile = images![0].file;
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Ingredients Field
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Ingredients *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24)
                  )
                ),
                onSaved: (value) => recipe.ingredients = value!,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            // Steps Field
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Steps *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24)
                  )
                ),
                onSaved: (value) => recipe.steps = value!,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: const Text('Cancel')
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Hive.box<RecipeModel>("recipe_box").add(recipe);
                      final directory = await getApplicationDocumentsDirectory();
                      final String path = '${directory.path}/image${recipe.key}.jpg';
                      final File file = File(path);
                      file.writeAsBytesSync(imagefile);
                      recipe.imagePath = file.path;
                      Hive.box<RecipeModel>("recipe_box").put(recipe.key, recipe);
                      if (context.mounted){
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: const Text('Add Recipe'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}