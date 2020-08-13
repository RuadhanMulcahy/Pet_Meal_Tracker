import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Pet_Meal_Tracker/DateTime/dateTimeHandler.dart';

Widget listTile(BuildContext context, DocumentSnapshot data) {

  DateTimeHandler dt = new DateTimeHandler();

  return ListTile(
    title: Text(data['20200810'])
  );
}

StreamBuilder mealListStream(BuildContext context) {  

    var length;
    
    return StreamBuilder<DocumentSnapshot>(
  
      stream: Firestore.instance.collection("Meals")
      .document("K7KP8BwAoEi6HWTiQMeB")
      .snapshots(),

      builder: (context, snapshot) {
        
        if(snapshot.data["meals"] != null) {
          length = snapshot.data["meals"].length;
        }

        return Expanded(
          child: ListView.builder(
            itemCount: length,
            shrinkWrap: false,
            itemBuilder: (context, index) {
              if(snapshot.data["meals"]!=null) {
                return Text(snapshot.data["meals"][index]);
              }
              else{
                return Text("Loading...");
              }
            }
          )
        );
      }
    );
}
