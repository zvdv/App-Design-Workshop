import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4D9),
      appBar: AppBar(
        title: Text(
          "Recipe Name",
          style: TextStyle(
            fontFamily: 'Gorditas',
          ),
        ),
        backgroundColor: Color(0xFF7A4A0F),
        foregroundColor: Color(0xFFFFFAEC),
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
                'assets/images/ema-datsi.jpg', // Should be image for current recipe
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
          Text(
            "Steps",
            style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontFamily: "Gorditas",
                  ),
          ),
          // List steps here
        ],
      ),
    );
  }
}
