import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");
  final response = await http.post(
    Uri.parse("$baseUrl/issues"),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token", // 🔥 IMPORTANT

    },
    body: jsonEncode({
      "Title": title,
      "Description": description,
      "CategoryId": categoryId, // ✅ NEW

    }),
  );
// 🔥 ADD THIS For testing
// print("STATUS: ${response.statusCode}");
// print("BODY: ${response.body}");

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception("Failed to create issue");
  }

}
  // FetchCategories as DropDown
  static Future<List<dynamic>> fetchCategories() async {
  final response = await http.get(
    Uri.parse("$baseUrl/Category"),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Failed to load categories");
  }
}

// Add Login API
static Future<String> login({
  //Declare parameter 
  required String email,   
  required String password,
}) async {
  final response = await http.post(
    Uri.parse("$baseUrl/auth/login"),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "email": email,
      "password": password,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['token']; // ⚠️ depends on your backend
  } else {
    throw Exception("Login failed");
  }
}

//Update Issue Method
static Future<void> updateIssue({
  required int id,
  required String title,
  required String description,
  required int categoryId,
}) async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");

  final response = await http.put(
    Uri.parse("$baseUrl/issues/$id"),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    },
    body: jsonEncode({
      "Title": title,
      "Description": description,
      "CategoryId": categoryId,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception("Failed to update issue");
  }
}

// Delete Issue Method
static Future<void> deleteIssue(int id) async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");

  final response = await http.delete(
    Uri.parse("$baseUrl/issues/$id"),
    headers: {
      "Authorization": "Bearer $token",
    },
  );

  if (response.statusCode != 200 && response.statusCode != 204) {
    throw Exception("Failed to delete issue");
  }
}


}






