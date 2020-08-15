import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Pet_Meal_Tracker/DateTime/dateTimeHandler.dart';
import 'package:Pet_Meal_Tracker/Services/datahandler.dart';

Widget listTile(context, data) {

  List<String> dataSplit = data.split("");
  DataHandler db = new DataHandler();

  var name = dataSplit.sublist(6, dataSplit.length).join();
  var time = dataSplit.sublist(0, 5).join();

  return Card(
    child: Row(
      children: [
        Expanded(
          child: Text(name),
        ),
        Expanded(
          child: Text(time),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {
              db.deleteMeal(time + '|' + name);
              print(time + '|' + name);
            }, 
            child: Text('x')
          )
        )
      ],
    )
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
                return listTile(context, snapshot.data["meals"][index]);
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

// return Text(snapshot.data["meals"][index]);