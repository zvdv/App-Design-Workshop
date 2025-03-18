import 'package:flutter/material.dart';

class SelectProvider extends ChangeNotifier {
  // Define variables
  bool showTemperature;
  bool showHumidity;
  bool showPrecipitation;

  SelectProvider({
    // Set default values
    this.showTemperature = true,
    this.showHumidity = true,
    this.showPrecipitation = true
  });

  // Create functions to change the variables
  void toggleTemperature(bool T){
    showTemperature = T;
    notifyListeners(); // Signals that something has changed to watchers of the SelectProvider
  }

  void toggleHumidity(bool H){
    showHumidity = H;
    notifyListeners();
  }

  void togglePrecipitation(bool P){
    showPrecipitation = P;
    notifyListeners();
  }
}