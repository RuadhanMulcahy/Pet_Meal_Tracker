import 'package:firebase_auth/firebase_auth.dart';
import 'package:Pet_Meal_Tracker/Models/user.dart';

class Auth {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {

    if(user!=null) {

      return User(uid: user.uid);

    } else {

      return null;
    }
  }

  // Sign in anonymous
  Future signInAnonymous() async {

    try {

      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;

      return _userFromFirebaseUser(user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password

  // Register with email and password

  // Sign out
}