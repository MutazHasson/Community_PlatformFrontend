import 'package:flutter/material.dart';

class IssueDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> issue;

  const IssueDetailsScreen({required this.issue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(issue['title'] ?? "Issue Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                issue['title'] ?? "No Title",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
        
              Text(
                issue['description'] ?? "No Description",
                style: TextStyle(fontSize: 16),
              ),
        
              SizedBox(height: 20),
        
             Row(
  children: [
    Icon(Icons.category),
    SizedBox(width: 5),
    Text(issue['categoryName'] ?? 'Unknown'),
  ],
)
            ],
          ),
        ),
      ),
    );
  }
}