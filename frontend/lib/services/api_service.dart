import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bridge_management_flutter/lib/models/maintenance_schedule.dart';

class ApiService {
  static const String _baseUrl = 'http://localhost:8000/api';

  // Existing methods...

  Future<List<MaintenanceSchedule>> fetchMaintenanceSchedule(int bridgeId) async {
    final response = await http.get(Uri.parse('$_baseUrl/bridges/$bridgeId/maintenance'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => MaintenanceSchedule.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load maintenance schedule');
    }
  }
}
