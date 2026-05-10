import 'package:flutter/material.dart';
import 'package:bridge_management_flutter/lib/models/bridge.dart';
import 'package:bridge_management_flutter/lib/services/api_service.dart';
import 'package:bridge_management_flutter/lib/screens/maintenance_schedule_screen.dart';

class BridgeDetailScreen extends StatefulWidget {
  final int bridgeId;
  const BridgeDetailScreen({Key? key, required this.bridgeId}) : super(key: key);

  @override
  State<BridgeDetailScreen> createState() => _BridgeDetailScreenState();
}

class _BridgeDetailScreenState extends State<BridgeDetailScreen> {
  late Future<Bridge> _futureBridge;

  @override
  void initState() {
    super.initState();
    _futureBridge = ApiService().fetchBridgeDetail(widget.bridgeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bridge Detail'),
      ),
      body: FutureBuilder<Bridge>(
        future: _futureBridge,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Bridge not found'));
          }
          final bridge = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bridge.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 8),
                Text('Location: ${bridge.location}'),
                const SizedBox(height: 8),
                Text('Condition: ${bridge.condition}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MaintenanceScheduleScreen(
                          bridgeId: bridge.id,
                        ),
                      ),
                    );
                  },
                  child: const Text('View Maintenance Schedule'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
