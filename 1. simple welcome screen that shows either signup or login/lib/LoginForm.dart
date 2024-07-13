import 'package:flutter/material.dart';
import 'package:form_validation/LoginForm.dart';
import 'package:form_validation/SignupForm.dart';

import 'package:form_validation/WelcomeScreen.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _userId = ""; // Stores simulated user ID

  // Simulated login logic (replace with actual authentication)
  bool _validateLogin(String email, String password) {
    return email == "user@example.com" && password == "password123";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: "Email"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your email";
              }
              return null;
            },
            onSaved: (value) => _email = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your password";
              }
              return null;
            },
            onSaved: (value) => _password = value!,
          ),
          ElevatedButton(
            // style: ElevatedButton.styleFrom(backgroundColor: Colors.green[900]),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (_validateLogin(_email, _password)) {
                  // Login successful, store simulated user ID
                  _userId = _email;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen(userId: _userId)),
                  );
                } else {
                  // Simulate login failure message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Invalid email or password")),
                  );
                }
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
