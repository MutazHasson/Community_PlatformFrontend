
import 'package:community_platform/providers/auth_provider.dart';
import 'package:community_platform/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      // ChangeNotifierProvider(create: (_) => IssueProvider()),
    ],

    child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
      // LoginScreen()
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