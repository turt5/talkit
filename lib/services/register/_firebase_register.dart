import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseRegister {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<bool> registerUser(String name, String email, String password,
      String gender, String dob, XFile image) async {
    try {
      UserCredential _uc = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? _user = _uc.user;

      if (_user == null) {
        return false;
      }

      String imagePath = 'user_images/${_user.uid}/${image.name}';

      UploadTask uploadTask =
          _firebaseStorage.ref(imagePath).putFile(File(image.path));

      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();

      await _database.collection('users').doc(_user.uid).set({
        "name": name,
        "email": email,
        "gender": gender,
        "dob": dob,
        "imageUrl": imageUrl,
        "createdAt": FieldValue.serverTimestamp()
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
