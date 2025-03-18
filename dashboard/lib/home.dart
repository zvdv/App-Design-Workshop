import 'package:dashboard/data_card.dart';
import 'package:dashboard/select.dart';
import 'package:dashboard/select_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Color(0xFF849F09),
        foregroundColor: Color(0xFFFFFFFF),
        actions: [
          IconButton(
            onPressed: (){
              // App pages behave like stack, push selection page to navigate to it
              Navigator.push(context, MaterialPageRoute<void>(builder: (context) => const Select()));
            }, 
            icon: Icon(Icons.edit)
          )
        ],
      ),
      body: DataGrid()
    );
  }
}

class DataGrid extends StatelessWidget {
  const DataGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(12),
      mainAxisSpacing: 12, // Vertical spacing between elements
      crossAxisSpacing: 12, // Horizontal spacing between elements
      children: [
        // Use if statement before widget to show it conditionally
        if (context.watch<SelectProvider>().showTemperature) // Gets current value of showTemperature via SelectProvider
        DataCard(
          value: 23.6,
          units: "°C",
          name: "Temperature",
        ),
        if (context.watch<SelectProvider>().showHumidity)
        DataCard(
          value: 70.8,
          units: "%",
          name: "Humidity",
        ),
        if (context.watch<SelectProvider>().showPrecipitation)
        DataCard(
          value: 5,
          units: "mm",
          name: "Precipitation",
        )
      ],
    );
  }
}