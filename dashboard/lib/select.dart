import 'package:dashboard/select_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Select extends StatelessWidget {
  const Select({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
              "Select Data to Show",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            CheckboxListTile(
              title: Text("Temperature"),
              value: context.watch<SelectProvider>().showTemperature, // Get current value of showTemperature via SelectProvider
              controlAffinity: ListTileControlAffinity.leading, // Put checkbox on left side of title
              onChanged: (bool? value) {
                context.read<SelectProvider>().toggleTemperature(value!); // Set showTemperature to new checkbox value via SelectProvider
              },
            ),
            CheckboxListTile(
              title: Text("Humidity"),
              value: context.watch<SelectProvider>().showHumidity,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                context.read<SelectProvider>().toggleHumidity(value!);
              },
            ),
            CheckboxListTile(
              title: Text("Precipitation"),
              value: context.watch<SelectProvider>().showPrecipitation,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                context.read<SelectProvider>().togglePrecipitation(value!);
              },
            ),
            ElevatedButton(
              onPressed: (){
                // Pop current page (Select) off the navigation stack, to return to home page
                Navigator.pop(context);
              },
              child: Text("OK"))
          ],
        ),
      ),
    );
  }
}