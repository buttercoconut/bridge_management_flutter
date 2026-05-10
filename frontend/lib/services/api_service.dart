import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/bridge.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8000';

  Future<List<Bridge>> fetchBridges() async {
    final response = await http.get(Uri.parse('$baseUrl/bridges'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Bridge.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load bridges');
    }
  }
}
