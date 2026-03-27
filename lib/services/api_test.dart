import 'package:http/http.dart' as http;

class ApiTest {
  static Future<void> fetchIssues() async {
    final url = Uri.parse(
      // "http://10.0.2.2:5016/api/issues",  // This is for android emulator 
      "http://localhost:5016/api/issues", // For windows
      // "https://jsonplaceholder.typicode.com/posts"  // This is external api demo
      
      );

    try {
      final response = await http.get(url);

      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");
    } catch (e) {
      print("ERROR: $e");
    }
  }
}

