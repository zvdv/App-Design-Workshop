import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  // Define properties of DataCard
  final double value;
  final String units;
  final String name;

  const DataCard({
    super.key,
    // Require properties be specified when using the widget
    required this.value,
    required this.units,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFBEDB3B),
      elevation: 8, // For shadow
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 30,
            )
          ),
          Text(
            units,
            style: TextStyle(
              fontSize: 30,
            )
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 30,
            )
          ),
        ],
      ),
    );
  }
}
