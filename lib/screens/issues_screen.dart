import 'package:community_platform/screens/create_issue_screen.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class IssuesScreen extends StatefulWidget {
  @override
  _IssuesScreenState createState() => _IssuesScreenState();
}

class _IssuesScreenState extends State<IssuesScreen> {
  late Future<List<dynamic>> issues;

  @override
  void initState() {
    super.initState();
    issues = ApiService.fetchIssues();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Issues"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: issues,
        builder: (context, snapshot) {
          // 🔄 Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // ❌ Error
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // 📭 Empty
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No issues found"));
          }

          // ✅ Data Loaded
          final data = snapshot.data!;
          

          return RefreshIndicator(
            onRefresh: () async {
    setState(() {
      issues = ApiService.fetchIssues();
    });
  },
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final issue = data[index];

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(issue['title'] ?? "No Title"),
                  subtitle: Text(issue['description'] ?? "No Description"),
                ),
              );
            },
          )
       ,);
          
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final result = await Navigator.push(context, 
        MaterialPageRoute(builder: (_) => CreateIssueScreen(),
        ),);
        //Refresh after returning
        if(result == true){
          setState(() {
            issues = ApiService.fetchIssues();
          });
        }
      },
      child: Icon(Icons.add),
      ),
    );
  }
}