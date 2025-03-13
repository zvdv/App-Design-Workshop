import 'package:collector/pages/home.dart';
import 'package:flutter/material.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => const HomePage())
          )
        },
        backgroundColor: Color(0xFF7A4A0F),
        shape: CircleBorder(),
        child: const Icon(Icons.home, color: Colors.white),
      ),
    );
  }
}