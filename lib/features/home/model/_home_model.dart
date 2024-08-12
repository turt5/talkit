import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeModel extends ChangeNotifier {
  Future<Map<String, dynamic>> getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return {
      'name': pref.getString('name'),
      "userId": pref.getString('userId'),
      "email": pref.getString('email'),
      "dob": pref.getString('dob'),
      "gender": pref.getString('gender'),
      "imageUrl": pref.getString('imageUrl')
    };
  }
}
