import 'package:flutter/material.dart';
import 'package:Pet_Meal_Tracker/Services/datahandler.dart';
import 'package:Pet_Meal_Tracker/Views/tracker/mealListWidget.dart';

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
              mealListStream(context),
              Row(
                children: <Widget>[
                  FlatButton(
                    onPressed:() {
                      db.addMeal('K7KP8BwAoEi6HWTiQMeB', 'Siun');
                    },
                    child: Text('Add Meal'), 
                  ),
                  FlatButton(
                    onPressed:() {
                      db.createGroup("Ruadhan");
                    },
                    child: Text('Create Group'), 
                  ),
                  FlatButton(
                    onPressed:() {
                      db.clearMeals();
                    },
                    child: Text('Clear meals'), 
                  )
                ]
              )
             ]
          )
        ),
    );
  }
}
