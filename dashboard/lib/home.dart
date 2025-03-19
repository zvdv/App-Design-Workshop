import 'package:dashboard/data_card.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/messages_provider.dart';
import 'package:dashboard/select.dart';
import 'package:dashboard/select_provider.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:provider/provider.dart';



class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool connected = false;

  void passMessages(List<MqttReceivedMessage<MqttMessage>> c){
    final recMessage = c[0].payload as MqttPublishMessage;
    final message = MqttPublishPayload.bytesToStringAsString(recMessage.payload.message);
    print('Received message:$message from topic: ${c[0].topic}');
    context.read<MessagesProvider>().setMessageAndTopic(c[0].topic, message);
  }

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
      body: Column(
        children: [
          Expanded(
            child: connected ? DataGrid() : SizedBox.shrink()
          ),
          Container(
      width: double.infinity,
      color: Color(0xFF849F09),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              connected ? 'MQTT connected!' : 'MQTT not connected.'
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await client.connect();
                  setState(() { connected = client.connectionStatus!.state == MqttConnectionState.connected; });
                  client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
                    passMessages(c);
                  });
                } on Exception catch (e) {
                  print('Client exception: $e');
                  client.disconnect();
                }
              },
              child: Text('Connect')
            )
          ],
        ),
      ))
        ],
      )
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
          mqttTopic: 'dashboard/temperature',
          units: "°C",
          name: "Temperature",
        ),
        if (context.watch<SelectProvider>().showHumidity)
        DataCard(
          mqttTopic: 'dashboard/humidity',
          units: "%",
          name: "Humidity",
        ),
        if (context.watch<SelectProvider>().showPrecipitation)
        DataCard(
          mqttTopic: 'dashboard/precipitation',
          units: "mm",
          name: "Precipitation",
        )
      ],
    );
  }
}