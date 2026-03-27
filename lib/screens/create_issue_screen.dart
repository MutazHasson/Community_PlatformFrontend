import 'package:community_platform/services/api_service.dart';
import 'package:flutter/material.dart';


class CreateIssueScreen extends StatefulWidget {
  const CreateIssueScreen({super.key});

  @override
  State<CreateIssueScreen> createState() => _CreateIssueScreenState();
}


class _CreateIssueScreenState extends State<CreateIssueScreen> {
final titleController = TextEditingController();
final descriptionController = TextEditingController();


bool isLoading = false;
//Load Categories, store selected category
List<dynamic> categories = [];
int? selectedCategoryId;
bool isLoadingCategories = true;

@override
void initState() {
  super.initState();
  loadCategories();
}

Future<void> loadCategories() async {
  try {
    final data = await ApiService.fetchCategories();
    setState(() {
      categories = data;
      isLoadingCategories = false;
    });
  } catch (e) {
    setState(() {
      isLoadingCategories = false;
    });
  }
}

Future<void> submit() async {
  if(selectedCategoryId == null){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please select a category")),
    );
  }
  setState(() => isLoading = true);

  try {
    await ApiService.createIssue(
      title: titleController.text, 
      description: descriptionController.text,
      categoryId: selectedCategoryId!, // add new
       );
    Navigator.pop(context, true); //Send success back
  } catch (e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error creating issue")),);
  }

  setState(() {
    isLoading = false;
  });
}

// UI section
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Issue"), centerTitle: true,),
      body: Padding(padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
              maxLines: 3,
            ),
        
            //Add DropDown for category
            isLoadingCategories
            ? CircularProgressIndicator()
            : SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField<int>(
                initialValue: categories.any((c) => c['id'] == selectedCategoryId)
                ? selectedCategoryId
                : null
                ,
                hint: Text("Select Category"),
                items: categories.map((category) {
                  return DropdownMenuItem<int>(
                    value: category['id'],
                    child: Text(category['name']),
                  );
                }).toList(), 
                onChanged: (value){
                  setState(() {
                    selectedCategoryId = value;
                  });
                }),
            ),
        
        
        
             SizedBox(height: 20),
             isLoading
             ? CircularProgressIndicator()
             : ElevatedButton(onPressed: submit, child: Text("Create"),),
          ],
        ),
      ),
      ),
    );
  }
}