import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
          FlatButton(
            onPressed: () {
              db.getData();
            },
            child: Text(
              "Flat Button",
            ),
          )
        ),
    );
  }
}

class DataHandler {

  final databaseReference = Firestore.instance;

  /*void getData() {
    databaseReference
        .collection("Meals")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
            snapshot.documents.forEach((f) => print(f.data));
    });
  }*/

  void getData() {
    databaseReference.collection("meals").getDocuments().then((querySnapshot) {
    querySnapshot.documents.forEach((result) {
      print(result.data);
    });
  });
  }

  void addData() {
    databaseReference.collection("meals").add({
      "31072020" : "09:00"
    }).then((value) {
      print(value.documentID);
    });
  }
}
