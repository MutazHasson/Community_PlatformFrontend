import 'package:community_platform/screens/issues_screen.dart';
import 'package:flutter/material.dart';
import 'services/api_test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IssuesScreen(),
      // TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Test")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ApiTest.fetchIssues();
          },
          child: Text("Fetch Issues"),
        ),
      ),
    );
  }
}