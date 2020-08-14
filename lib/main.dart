import 'package:Pet_Meal_Tracker/Views/Login/login.dart';
import 'package:Pet_Meal_Tracker/Views/authWrapper.dart';
import 'package:flutter/material.dart';
import 'package:Pet_Meal_Tracker/Views/tracker/trackerView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login()
    );
  }
}

