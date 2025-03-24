import 'package:flutter/material.dart';
import 'package:inventory/about.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
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
      backgroundColor: Color.fromARGB(255, 198, 224, 255),
      appBar: AppBar(
        title: Text('Inventory'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
            },
            icon: Icon(Icons.info)
          )
        ],
      ),
      body: Column(
        children: [
          InventoryCard(name: 'Apples'),
          InventoryCard(name: 'Watermelon'),
          InventoryCard(name: 'Grapes'),
          InventoryCard(name: 'Bananas')
        ],
      ),
    );
  }
}

class InventoryCard extends StatefulWidget {
  final String name;

  const InventoryCard({
    super.key,
    required this.name
  });

  @override
  State<InventoryCard> createState() => _InventoryCardState();
}

class _InventoryCardState extends State<InventoryCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.name),
            SizedBox(width: 100),
            IconButton(
              onPressed: (){
                setState(() {
                  quantity = quantity - 1;
                });
              }, 
              icon: Icon(Icons.remove)
            ),
            Text(quantity.toString()),
            IconButton(
              onPressed: (){
                setState(() {
                  quantity = quantity + 1;
                });
              },
              icon: Icon(Icons.add)
            )
          ],
        ),
      ),
    );
  }
}
