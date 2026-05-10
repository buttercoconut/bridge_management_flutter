import 'package:flutter/material.dart';
import 'package:bridge_management_flutter/lib/models/bridge.dart';
import 'package:bridge_management_flutter/lib/services/api_service.dart';
import 'package:bridge_management_flutter/lib/widgets/bridge_card.dart';

class BridgeListScreen extends StatefulWidget {
  const BridgeListScreen({Key? key}) : super(key: key);

  @override
  State<BridgeListScreen> createState() => _BridgeListScreenState();
}

class _BridgeListScreenState extends State<BridgeListScreen> {
  late Future<List<Bridge>> _futureBridges;

  @override
  void initState() {
    super.initState();
    _futureBridges = ApiService().fetchBridges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bridge List'),
      ),
      body: FutureBuilder<List<Bridge>>(
        future: _futureBridges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No bridges found'));
          }
          final bridges = snapshot.data!;
          return ListView.builder(
            itemCount: bridges.length,
            itemBuilder: (context, index) {
              return BridgeCard(
                bridge: bridges[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BridgeDetailScreen(
                        bridgeId: bridges[index].id,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
