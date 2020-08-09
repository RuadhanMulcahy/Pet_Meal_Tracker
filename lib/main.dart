import 'package:flutter/material.dart';
import 'package:Pet_Meal_Tracker/Database/datahandler.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  _MyAppState createState() => _MyAppState();  
}


class _MyAppState extends State<MyApp> {

  DataHandler db = new DataHandler();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: 
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                 db.deleteMeal("20:33");
                },
                child: Text(
                  "Delete meal",
                ),
              ),
              FlatButton(
                onPressed: () {
                 db.addMeal();
                },
                child: Text(
                  "Add Meal",
                ),
              )
            ]
          )
        ),
    );
  }
}

