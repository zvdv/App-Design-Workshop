import 'package:collector/models/recipe_model.dart';
import 'package:collector/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

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
      body: RecipeForm(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => const HomePage())
          )
        },
        backgroundColor: Color(0xFF7A4A0F),
        shape: CircleBorder(),
        child: const Icon(Icons.home, color: Color(0xFFFFFAEC)),
      ),
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
  RecipeModel recipe = RecipeModel(title: '', imagePath: 'assets/images/ema-datsi.jpg', ingredients: '', steps: '');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // MyFormField(name: 'Title'),
            // MyFormField(name: 'Image'), // For now pass a path to an existing image
            // MyFormField(name: 'Ingredients'),
            // MyFormField(name: 'Steps'),

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
            // Image Field ( TODO : replace with image uploader)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Image path *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24)
                  )
                ),
                onSaved: (value) => recipe.imagePath = value!,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            // Ingredients Field
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
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
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Hive.box<RecipeModel>("recipe_box").add(recipe);
                }
              },
              child: const Text('Add Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyFormField extends StatelessWidget {
//   final String name;

//   const MyFormField({
//     super.key,
//     required this.name
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: TextFormField(
//         decoration: InputDecoration(
//           labelText: '$name *',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24)
//           )
//         ),
//         // The validator receives the text that the user has entered.
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter some text';
//           }
//           return null;
//         },
//       ),
//     );
//   }
// }