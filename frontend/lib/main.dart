import 'package:flutter/material.dart';
import 'package:bridge_management_flutter/lib/screens/bridge_list_screen.dart';

void main() {
  runApp(const BridgeManagementApp());
}

class BridgeManagementApp extends StatelessWidget {
  const BridgeManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bridge Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BridgeListScreen(),
    );
  }
}
