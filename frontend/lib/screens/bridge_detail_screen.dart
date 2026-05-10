import 'package:flutter/material.dart';
import '../models/bridge.dart';

class BridgeDetailScreen extends StatelessWidget {
  const BridgeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Bridge bridge = ModalRoute.of<BuildContext>(context)!.settings.arguments as Bridge;
    return Scaffold(
      appBar: AppBar(
        title: Text(bridge.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('위치: ${bridge.location}', style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(height: 8),
            Text('상태: ${bridge.status}', style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/maintenance', arguments: bridge);
              },
              child: const Text('유지보수 일정'),
            ),
          ],
        ),
      ),
    );
  }
}
