import 'package:flutter/material.dart'; // Always needed

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 224, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Tell Flutter not to automatically create the back button on the app bar on a new page
        leading: IconButton(// This leading IconButton is automatically added when automaticallyImplyLeading is true
          onPressed: (){
            Navigator.pop(context); // Pop current page from the navigation stack, bringing us back to our home page
          },
          icon: Icon(Icons.arrow_back) // Back arrow icon
        ),
        title: Text('About'), // Title on app bar
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center( // Center widget is one way to position a single widget
        child: Text('New information!'),
      ),
    );
  }
}
