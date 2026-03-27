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
// Post Issue Method
static Future<void> createIssue({
  required String title,
  required String description,
}) async {
  final response = await http.post(
    Uri.parse("$baseUrl/issues"),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "title": title,
      "description": description,
    }),
  );

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception("Failed to create issue");
  }
}












}

