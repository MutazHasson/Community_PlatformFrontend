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
  required int categoryId,
}) async {
  final response = await http.post(
    Uri.parse("$baseUrl/issues"),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "title": title,
      "description": description,
      "categoryId": categoryId, // ✅ NEW

    }),
  );

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception("Failed to create issue");
  }

}
  // FetchCategories as DropDown
  static Future<List<dynamic>> fetchCategories() async {
  final response = await http.get(
    Uri.parse("$baseUrl/categories"),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Failed to load categories");
  }
}


}






