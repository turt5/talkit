import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talkit/features/login/view/pages/_login_page.dart';

class FirebaseLogin {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      UserCredential _uc = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      User? _user = _uc.user;

      if (_user == null) {
        return null;
      }

      DocumentSnapshot userDoc =
          await _database.collection('users').doc(_user.uid).get();

      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

      preferences.setString("userId", _user.uid);
      preferences.setString("name", userData!['name']);
      preferences.setString("email", userData['email']);
      preferences.setString("gender", userData['gender']);
      preferences.setString("dob", userData['dob']);
      preferences.setString("imageUrl", userData['imageUrl']);

      return userData;
    } on FirebaseAuthException catch (e) {
      return {"error": "${e.message}"};
    } catch (e) {
      return {"error": "Something went wrong"};
    }
  }

  Future<void> logoutUser(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _firebaseAuth.signOut();
    preferences.remove("userId");
    preferences.remove("name");
    preferences.remove("email");
    preferences.remove("gender");
    preferences.remove("dob");
    preferences.remove("imageUrl");

    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => LoginPage()));
  }
}
