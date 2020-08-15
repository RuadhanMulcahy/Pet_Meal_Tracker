import 'package:Pet_Meal_Tracker/Views/authWrapper.dart';
import "package:flutter/material.dart";
import "package:Pet_Meal_Tracker/Services/auth.dart";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Login'),
        ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () async {
              dynamic result = await _auth.signInAnonymous();
              if( result== null) {
                print("Sign in error.");
              } else {
                print('Sign in successful');
                print(result.uid);
              }
            },
            child: Text('Sign in anonymously')
          )
        ],
      )   
    );
  }
}

