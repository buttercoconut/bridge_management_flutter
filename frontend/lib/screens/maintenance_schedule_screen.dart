import 'package:flutter/material.dart';
import '../models/bridge.dart';

class MaintenanceScheduleScreen extends StatelessWidget {
  const MaintenanceScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Bridge bridge = ModalRoute.of<BuildContext>(context)!.settings.arguments as Bridge;
    return Scaffold(
      appBar: AppBar(
        title: Text('${bridge.name} 유지보수 일정'),
      ),
      body: const Center(
        child: Text('유지보수 일정은 아직 구현되지 않았습니다.'),
      ),
    );
  }
}
