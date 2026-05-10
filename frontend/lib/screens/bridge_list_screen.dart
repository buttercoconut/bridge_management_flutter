import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bridge_provider.dart';
import '../widgets/bridge_card.dart';

class BridgeListScreen extends StatelessWidget {
  const BridgeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bridgeProvider = Provider.of<BridgeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('교량 목록'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await bridgeProvider.fetchBridges();
        },
        child: ListView.builder(
          itemCount: bridgeProvider.bridges.length,
          itemBuilder: (context, index) {
            final bridge = bridgeProvider.bridges[index];
            return BridgeCard(
              bridge: bridge,
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: bridge);
              },
            );
          },
        ),
      ),
    );
  }
}
