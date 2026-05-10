import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/bridge_provider.dart';
import 'screens/bridge_list_screen.dart';
import 'screens/bridge_detail_screen.dart';
import 'screens/maintenance_schedule_screen.dart';

void main() {
  runApp(const BridgeApp());
}

class BridgeApp extends StatelessWidget {
  const BridgeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BridgeProvider()),
      ],
      child: MaterialApp(
        title: 'Bridge Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const BridgeListScreen(),
          '/detail': (context) => const BridgeDetailScreen(),
          '/maintenance': (context) => const MaintenanceScheduleScreen(),
        },
      ),
    );
  }
}
