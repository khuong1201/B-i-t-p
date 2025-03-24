import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/task_model.dart';

class ApiService {
  // Base URL for the API
  final String baseUrl = 'https://amock.io/api/researchUTH';

  // HTTP headers
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Get all tasks
  Future<List<Task>> getTasks() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/tasks'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['isSuccess'] == true) {
          final List<dynamic> data = jsonResponse['data'];
          return data.map((json) => Task.fromMap(json)).toList();
        } else {
          throw Exception('API returned error: ${jsonResponse['message']}');
        }
      } else {
        throw Exception('Failed to load tasks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching tasks: $e');
    }
  }
}
