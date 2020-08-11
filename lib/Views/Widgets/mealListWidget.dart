import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Pet_Meal_Tracker/DateTime/dateTimeHandler.dart';
import 'dart:async';

Widget listTile(BuildContext context, DocumentSnapshot data) {

  DateTimeHandler dt = new DateTimeHandler();

  return ListTile(
    title: Text(data['20200810'])
  );
}

StreamBuilder mealListStream(BuildContext context) {  
    
    return StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance.collection('Meals')
      .document('pckT2TNMaE0ep1SLTL5v')
      .snapshots(),
      builder: (context, snapshot) {

        if(!snapshot.hasData) {
          return Text('null'); 
        }

        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.data['20200810'].length,
            itemBuilder: (context, index) {
              return Text(snapshot.data['20200810'][index]);
            }
          )
        );
      }
    );
}
