import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talkit/features/home/view/pages/_homepage.dart';
import 'package:talkit/features/login/view/pages/_login_page.dart';

void changeScreenAutomatically(context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool hasUser = sharedPreferences.containsKey('userId');

  Future.delayed(const Duration(seconds: 2), () {
    Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
            builder: (context) => hasUser ? HomePage() : LoginPage()));
  });
}
