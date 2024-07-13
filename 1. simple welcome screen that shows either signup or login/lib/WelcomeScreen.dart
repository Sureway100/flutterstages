import 'package:flutter/material.dart';
import 'package:form_validation/LoginForm.dart';
import 'package:form_validation/SignupForm.dart';



class WelcomeScreen extends StatelessWidget {
  final String userId;

  const WelcomeScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome, $userId"),
              ElevatedButton(
                onPressed: () => Navigator.pop(context), // Go back to home screen
                child: Text("Go Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
