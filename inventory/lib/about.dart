import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 224, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // This leading IconButton is automatically added when automaticallyImplyLeading is true (default)
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back)
        ),
        title: Text('About'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('New information!'),
      ),
    );
  }
}
