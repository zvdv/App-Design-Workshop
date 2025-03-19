import 'package:flutter/material.dart';

class MessagesProvider extends ChangeNotifier {
  // Define variables
  String? topic;
  String? message;

  MessagesProvider();

  void setMessageAndTopic(String T, String M){
    topic = T;
    message = M;
    notifyListeners(); // Signals that something has changed to watchers of the MessagesProvider
  }
}