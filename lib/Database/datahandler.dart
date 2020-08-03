import 'package:cloud_firestore/cloud_firestore.dart';

class DataHandler {

  final databaseReference = Firestore.instance;

  // Get Meals
  void getMeals() {
    databaseReference.collection("meals").getDocuments().then((querySnapshot) {
    querySnapshot.documents.forEach((result) {
      print(result.data);
    });
  });
  }

  // Add Meal
  void addMeal() {

    var mealTime1 = "9:31";
    var mealTime2 = "11:44";

    var array = [mealTime1, mealTime2];

    var data = {
      "02082020": array
    };

    databaseReference.collection("Meals")
      .document("rx9zwtilIoMO04XLOw8g")
        .setData(data).then((value) {
          print("Successful write.");
        }).catchError((error) {
          print(error);
        });
  }

  // Delete Meal
  void deleteMeal(docName, meal) {
    databaseReference.collection("meals")
      .document(docName);
  }

  // Add Document
  void addDocument(var1, var2) {
    databaseReference.collection("meals").add({
      var1 : var2
    }).then((value) {
      print(value.documentID);
    });
  }

  // Delete Document
  void deleteDocument(docName) {
    databaseReference.collection("meals")
    .document(docName)
    .delete()
    .then((value) 
      { 
        print("Doc deleted");
      }
    ).catchError((onError) {
      print(onError);
    });
  }
}