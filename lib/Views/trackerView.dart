import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Pet_Meal_Tracker/Database/datahandler.dart';
import 'package:Pet_Meal_Tracker/Views/Widgets/mealListWidget.dart';

class Tracker extends StatefulWidget {

  _TrackerState createState() => _TrackerState();  
}


class _TrackerState extends State<Tracker> {

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
          Column(
            children: <Widget>[
              mealListStream(context)
            ]
          )
        ),
    );
  }
}
