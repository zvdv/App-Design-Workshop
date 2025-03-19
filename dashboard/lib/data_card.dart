import 'package:dashboard/main.dart';
import 'package:dashboard/messages_provider.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:provider/provider.dart';

class DataCard extends StatefulWidget {
  // Define properties of DataCard
  //final double value;
  final String mqttTopic;
  final String units;
  final String name;

  DataCard({
    super.key,
    // Require properties be specified when using the widget
    required this.mqttTopic,
    required this.units,
    required this.name
  }){
    mqttSubscribe();
  }

  void mqttSubscribe(){
    client.subscribe(mqttTopic, MqttQos.atLeastOnce);
  }

  @override
  State<DataCard> createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {
  String? value; // TODO : change back to double

  @override
  Widget build(BuildContext context) {
    if (context.watch<MessagesProvider>().topic == widget.mqttTopic){
      value = context.watch<MessagesProvider>().message;
    }

    return Card(
      color: Color(0xFFBEDB3B),
      elevation: 8, // For shadow
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value == null ? '-' : value.toString(),
            style: TextStyle(
              fontSize: 30,
            )
          ),
          Text(
            widget.units,
            style: TextStyle(
              fontSize: 30,
            )
          ),
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 30,
            )
          ),
        ],
      ),
    );
  }
}
