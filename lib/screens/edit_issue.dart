import 'package:flutter/material.dart';
import '../services/api_service.dart';

class EditIssueScreen extends StatefulWidget {
  final Map<String, dynamic> issue;

  const EditIssueScreen({required this.issue});

  @override
  _EditIssueScreenState createState() => _EditIssueScreenState();
}

class _EditIssueScreenState extends State<EditIssueScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();

    titleController =
        TextEditingController(text: widget.issue['title']);
    descriptionController =
        TextEditingController(text: widget.issue['description']);
  }

  Future<void> update() async {
    await ApiService.updateIssue(
      id: widget.issue['id'],
      title: titleController.text,
      description: descriptionController.text,
      categoryId: widget.issue['categoryId'], // keep same for now
    );

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Issue")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: titleController),
            SizedBox(height: 10),
            TextField(controller: descriptionController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: update,
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}