import 'package:community_platform/screens/issues_screen.dart';
import 'package:community_platform/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

// Creating Login Methode
Future<void> login() async {
  try{
    final token = await ApiService.login(
      email: emailController.text, 
      password: passwordController.text
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => IssuesScreen()),);

  } catch (e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")),);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true,),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: emailController,
          ), 
          TextField(controller: passwordController, obscureText: true,),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: login, child: Text("Login")),

        ],
      ),),
      
    );
  }
}