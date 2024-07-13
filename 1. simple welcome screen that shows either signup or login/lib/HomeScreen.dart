import 'package:flutter/material.dart';
import 'package:form_validation/LoginForm.dart';
import 'package:form_validation/SignupForm.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showSignup = true; // Toggles between signup and login forms

  void _toggleForm() {
    setState(() => _showSignup = !_showSignup);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.green[900],
          title: Text("Xyterim"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_showSignup ? "Sign Up" : "Login"),
              SizedBox(height: 20),
              _showSignup ? SignupForm() : LoginForm(),
              TextButton(
                onPressed: _toggleForm,
                child: Text(
                  _showSignup
                      ? "Already have an account? Login"
                      : "New User? Sign Up",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
