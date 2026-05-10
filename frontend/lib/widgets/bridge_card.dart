import 'package:flutter/material.dart';
import '../models/bridge.dart';

class BridgeCard extends StatelessWidget {
  final Bridge bridge;
  final VoidCallback onTap;

  const BridgeCard({Key? key, required this.bridge, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(bridge.name),
        subtitle: Text('위치: ${bridge.location}'),
        trailing: Text('상태: ${bridge.status}'),
        onTap: onTap,
      ),
    );
  }
}
