import 'package:flutter/material.dart';
import 'package:bridge_management_flutter/lib/models/maintenance_schedule.dart';
import 'package:bridge_management_flutter/lib/services/api_service.dart';

class MaintenanceScheduleScreen extends StatefulWidget {
  final int bridgeId;
  const MaintenanceScheduleScreen({Key? key, required this.bridgeId}) : super(key: key);

  @override
  State<MaintenanceScheduleScreen> createState() => _MaintenanceScheduleScreenState();
}

class _MaintenanceScheduleScreenState extends State<MaintenanceScheduleScreen> {
  late Future<List<MaintenanceSchedule>> _futureSchedule;

  @override
  void initState() {
    super.initState();
    _futureSchedule = ApiService().fetchMaintenanceSchedule(widget.bridgeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance Schedule'),
      ),
      body: FutureBuilder<List<MaintenanceSchedule>>(
        future: _futureSchedule,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No maintenance schedule found'));
          }
          final schedule = snapshot.data!;
          return ListView.builder(
            itemCount: schedule.length,
            itemBuilder: (context, index) {
              final item = schedule[index];
              return ListTile(
                title: Text(item.task),
                subtitle: Text('Due: ${item.dueDate}'),
                trailing: Text(item.status),
              );
            },
          );
        },
      ),
    );
  }
}
