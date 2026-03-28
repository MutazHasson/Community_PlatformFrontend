
import 'package:community_platform/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
      //IssuesScreen(),
      // TestScreen(),
    );
  }
}





// API Test Class
// class TestScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("API Test")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             ApiTest.fetchIssues();
//           },
//           child: Text("Fetch Issues"),
//         ),
//       ),
//     );
//   }
// }

// git add .
// git commit -m "meaningful message"
// git push