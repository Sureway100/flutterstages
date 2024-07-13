import 'package:flutter/material.dart';
import 'package:form_validation/LoginForm.dart';
import 'package:form_validation/SignupForm.dart';
import 'package:form_validation/WelcomeScreen.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  int _age = 0;
  String _gender = "";
  String _career = "";

  List<String> _careers = ["Student", "Developer", "Doctor", "Other"];

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
          TextFormField(
            decoration: InputDecoration(labelText: "Age"),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your age";
              }
              return null;
            },
            onSaved: (value) => _age = int.parse(value!),
          ),
          Row(
            children: [
              Text("Gender: "),
              Radio(
                value: "Male",
                groupValue: _gender,
                onChanged: (value) => setState(() => _gender = value as String),
              ),
              Text("Male"),
              Radio(
                value: "Female",
                groupValue: _gender,
                onChanged: (value) => setState(() => _gender = value as String),
              ),
              Text("Female"),
            ],
          ),
          DropdownButtonFormField(
            value: _careers.first,
            hint: Text("Select Career"),
            items: _careers
                .map((career) => DropdownMenuItem(
                      value: career,
                      child: Text(career),
                    ))
                .toList(),
            onChanged: (value) => setState(() => _career = value as String),
          ),
          ElevatedButton(
            // style: ElevatedButton.styleFrom(backgroundColor: Colors.green[900]),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Simulate data storage and navigate to welcome screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelcomeScreen(userId: _email)),
                );
              }
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                // backgroundColor: Colors.green[900],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
