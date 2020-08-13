import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Pet_Meal_Tracker/DateTime/dateTimeHandler.dart';

class DataHandler {

  final databaseReference = Firestore.instance;
  DateTimeHandler dt = new DateTimeHandler();

  // Get Meals
  DocumentSnapshot getMeals(groupName) {

    var meals; 

    databaseReference.collection("Meals")
    .document('K7KP8BwAoEi6HWTiQMeB').get()
    .then((data) => meals = data);
    
    return meals;
    }
  
  // Add Meal
  void addMeal(groupName, user) {

    var mealTime = dt.getTime();

    var data = {
      "meals" : FieldValue.arrayUnion([mealTime + '|' + user]),
    };

    databaseReference.collection("Meals")
      .document(groupName)
        .updateData(data).then((value) {
          print("Successful write.");
        }).catchError((error) {
          print(error);
        });
  }

  // Clear Meals
  void clearMeals() {

    var data = {
      "meals": FieldValue.delete(),
    };

    databaseReference.collection("Meals")
      .document("K7KP8BwAoEi6HWTiQMeB")
        .updateData(data).then((value) {
          addMeal("K7KP8BwAoEi6HWTiQMeB", "Ruadhan");
        }).catchError((error) {
          print(error);
        });

  }

  // Delete Meal
  void deleteMeal(meal) {

    var data = {
      dt.getDate(): FieldValue.arrayRemove([meal]),
    };

    databaseReference.collection("Meals")
      .document("rx9zwtilIoMO04XLOw8g")
        .updateData(data).then((value) {
          print("Successfuly removed $meal.");
        }).catchError((error) {
          print(error);
        });
  }

  // Create Group
  void createGroup(userName) {
    databaseReference.collection("Meals").add({
      "meals" : {},
      "admin" : userName,
      "currentDate" : dt.getDate(),
      "createdDate" : dt.getDate()
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