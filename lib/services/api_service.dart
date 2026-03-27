import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:5016/api";

  static Future<List<dynamic>> fetchIssues() async {
    final response = await http.get(
      Uri.parse("$baseUrl/issues"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load issues");
    }
  }
}

