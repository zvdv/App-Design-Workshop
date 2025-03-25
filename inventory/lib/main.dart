import 'package:flutter/material.dart'; // Always needed
import 'package:inventory/about.dart'; // Our about page file

void main() {
  // Main function, program starts here
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner in top right corner of running app
      home: Home(), // Set landing page (we extracted this widget to define it below)
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 224, 255), // Background colour for body of app
      appBar: AppBar(
        title: Text('Inventory'), // Title on app bar
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white, // Applies to text and icons on app bar
        actions: [ // Can add as many actions as you want, will appear on right side of app bar
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>About())); // Push about page onto navigation stack
            },
            icon: Icon(Icons.info) // Use info icon from Flutter's default icons
          )
        ],
      ),
      body: Column( // Use a column to layout multiple widgets vertically
        children: [
          InventoryCard(name: 'Apples'), // Custom widget we defined and extracted below
          InventoryCard(name: 'Watermelon'), // We can specify a different name for each instance of this widget
          InventoryCard(name: 'Grapes'),
          InventoryCard(name: 'Bananas')
        ],
      ),
    );
  }
}

class InventoryCard extends StatefulWidget {
  final String name; // Create property we can set when we use this widget (this kind of variable can be used in both stateless and stateful widgets)

  const InventoryCard({
    super.key,
    required this.name // Requires name to be set in order to make the widget
  });

  @override
  State<InventoryCard> createState() => _InventoryCardState();
}

class _InventoryCardState extends State<InventoryCard> {
  int quantity = 0; // Create state variable (can change without creating a new InventoryCard)

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber, // Background colour of card
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10), // Space around card
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Space within card, around row
        child: Row( // Use a row to layout multiple widgets horizontally
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Change alignment of widgets within row
          children: [
            Text(widget.name), // Use name property of InventoryCard (need widget. because it's a variable from the widget itself, not the state)
            SizedBox(width: 100), // Make some space
            IconButton(
              onPressed: (){
                setState(() { // Use setState function to tell Flutter something will need to be updated on the screen
                  quantity = quantity - 1; // Update the state variable
                });
              }, 
              icon: Icon(Icons.remove) // Minus icon
            ),
            Text(quantity.toString()), // Use quantity variable (.toString() because quantity is an int)
            IconButton(
              onPressed: (){
                setState(() {
                  quantity = quantity + 1;
                });
              },
              icon: Icon(Icons.add) // Plus icon
            )
          ],
        ),
      ),
    );
  }
}
