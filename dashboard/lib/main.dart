import 'package:dashboard/home.dart';
import 'package:dashboard/messages_provider.dart';
import 'package:dashboard/select_provider.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:provider/provider.dart';

// Future<MqttClient> mqttConnect() async {
//   int rand = Random().nextInt(1000000000);
//   String clientId = 'flutter_dashboard_client_$rand';
//   MqttBrowserClient client = MqttBrowserClient('ws://broker.emqx.io', clientId);
//   client.keepAlivePeriod = 200;
//   client.connectionMessage = MqttConnectMessage();
//   try {
//     print('Connecting');
//     await client.connect();
//     print('Connected');
//   } catch (e) {
//     print('Exception: $e');
//     client.disconnect();
//   }

//   client.logging(on: true);

//   return client;
// }

final client = MqttBrowserClient.withPort('ws://broker.emqx.io/mqtt', 'zoes_flutter_dashboard', 8083);

void mqttConnect() async {
  try {
    await client.connect();
  } on Exception catch (e) {
    print('Client exception: $e');
    client.disconnect();
  }
}

void main() async {
  //MqttClient client = await mqttConnect();
  //client.subscribe("zoe/test", MqttQos.atLeastOnce);

  client.logging(on: true);
  // client.setProtocolV311();
  // client.keepAlivePeriod = 60;
  client.connectTimeoutPeriod = 10000;
  // client.port = 8083;
  client.onConnected = () => print('Connected!');

  // try {
  //   await client.connect();
  // } on Exception catch (e) {
  //   print('Client exception: $e');
  //   client.disconnect();
  // }

  // if (client.connectionStatus!.state == MqttConnectionState.connected){
  //   client.subscribe('zoe/test', MqttQos.atLeastOnce);
  //   client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
  //     final recMessage = c![0].payload as MqttPublishMessage;
  //     final payload = MqttPublishPayload.bytesToStringAsString(recMessage.payload.message);
  //     print('Received message:$payload from topic: ${c[0].topic}');
  //   });
  // }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Wrap MaterialApp with ChangeNotifierProvider so that changes to the SelectProvider are accessible to all the pages
      providers: [
        ChangeNotifierProvider(create: (context) => SelectProvider()),
        ChangeNotifierProvider(create: (context) => MessagesProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Hide Debug banner
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF849F09)) // Default colours will be set based on this colour seed
        ),
        home: Home(), // Set landing page
      )
    );
  }
}